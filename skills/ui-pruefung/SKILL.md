---
name: ui-pruefung
description: Prüft eine Cockpit-Fläche oder ein Mockup systematisch — Rendering über Viewports, Overflow, Konsole, Animationen, Wisch-Grammatik, Kontrast — bevor sie Markus vorgelegt wird.
---

# UI-Prüfung — der Ablauf vor jeder Vorlage

*Entstanden 31.07.2026 auf Markus' Frage („gibts Tools, damit du deine Arbeit
in der UI nachprüfen kannst?"). Grundsatz: Gegen das BILD prüfen, nicht gegen
die Absicht — und Funde reparieren, BEVOR Markus sie sieht.*

## Wann

Nach jedem UI-Bau oder Mockup, vor SendUserFile/Commit. Ziel-URL:
Mockups über `python3 -m http.server 8899` in docs/mockups; prod über
Claude-in-Chrome (Markus' Session) oder cockpit-inky.vercel.app.

## Die Prüfschritte (in dieser Reihenfolge)

1. **tsc** — `npx tsc --noEmit`. Rot = Stopp.
2. **Viewport-Matrix** (Playwright): Screenshots bei **390** (iPhone),
   **768** (iPad), **1280** (Mac). Jede Fläche einmal oben, einmal ganz
   unten gescrollt. Screenshots ANSCHAUEN (Read), nicht nur schießen —
   auf: abgeschnittene Texte, kollidierende Etiketten, leere Riesenflächen,
   Karten außerhalb des Rasters.
3. **Overflow-Wächter** — das Skript liegt eingelagert:
   `~/Code/cockpit/tools/ui-pruefung/wachter.js` lesen und via
   browser_evaluate injizieren. Meldet SAUBER oder konkrete Funde
   (horizontales Scrollen, herausragende Elemente, gesprengte Textboxen,
   kaputte Bilder).
4. **Konsole** — Playwright console messages; jeder Error ist ein Fund
   (Favicon-404 ausgenommen).
5. **Animationen** — zwei Wege: (a) Serien-Screenshots (3–5 im Abstand von
   400 ms) und vergleichen, ob sich bewegt, was sich bewegen soll;
   (b) für Übergänge/Orb: Claude-in-Chrome `gif_creator` aufnehmen und das
   GIF ansehen. Zusätzlich `document.getAnimations().length` gegen die
   Erwartung. `prefers-reduced-motion` einmal via
   `page.emulateMedia({reducedMotion: 'reduce'})` gegenprüfen (Playwright
   browser_run_code_unsafe oder neue Session).
6. **Wisch-Grammatik** — jede definierte Geste synthetisch feuern
   (PointerEvents: down → mehrere move → up, dx/dy über der Schwelle) und
   den ZUSTAND DANACH verifizieren (DOM/State via Evaluate), nicht nur den
   Screenshot. Gegenprobe: kleiner Wisch unter der Schwelle darf NICHTS
   auslösen; Tap auf Knöpfe in wischbaren Karten muss klicken
   (Pointer-Capture-Falle, Fund 31.07.).
7. **Kontrast + Tap-Ziele** — axe-core liegt EINGELAGERT (kein CDN, keine
   CSP-Falle): `~/Code/cockpit/tools/ui-pruefung/axe.min.js` als String
   lesen, via browser_evaluate `eval()`en, dann `axe.run()` und
   `violations` melden (Kontrast, Tap-Ziele < 44px).
8. **Screenshot-Diff** (Design-Drift messbar): Baselines liegen in
   `docs/mockups/baselines/<flaeche>-<breite>.png`. Vergleich:
   `node ~/Code/cockpit/tools/ui-pruefung/diff.mjs baseline.png ist.png diff.png`
   → JSON mit Prozent; > 1,5 % = ansehen und begründen (gewollt oder Drift?).
   Nach abgenommenen Umbauten Baseline erneuern.
9. **Safe-Area/Nativ** (wenn App-relevant): iOS-Simulator — verifiziert
   31.07. mit iPhone 17 Pro (`077F3031-E290-4C0C-BD09-33AFFA86325B`):
   `xcrun simctl boot <id>` · `xcrun simctl openurl <id> <url>` ·
   `xcrun simctl io <id> screenshot s.png` · danach `sips -Z 900` fürs
   Ansehen und `xcrun simctl shutdown <id>`. Prüft Dynamic Island,
   Safe-Areas, echtes WebKit. Browser-Tests können das NICHT (Fund 26.07.).

## Grenzen — ehrlich benennen, nie behaupten

- **Haptik ist nur am Gerät fühlbar.** Prüfbar ist ausschließlich, dass das
  richtige `haptik`-Signal an die native Brücke geht (Konsolen-Log der
  Bridge-Message). Das Gefühl bleibt Markus' Gerätetest.
- Screenshot-Serien beweisen Bewegung, nicht Eleganz — bei Zweifel GIF
  aufnehmen und ansehen.
- Der Bericht an Markus nennt: was geprüft wurde, was gefunden und repariert
  wurde, was NICHT prüfbar war.

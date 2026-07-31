# Der Werkzeugkasten

*Stand 31.07.2026 — was Claude zur Verfügung hat und was es kostet.*

## Die Steckdose: Cockpit (33 Werkzeuge)
`https://mcp.cockpitport.com/api/mcp` — der Hauptzugang zu Markus' Welt.

**Der erste Griff jeder Session:** `cockpit_zuhause` — liefert DAS PROTOKOLL,
Über-Markus, Projekte und Stände, was auf sein Urteil wartet, jüngste
Ereignisse, Wiener Zeit.

| Gruppe | Werkzeuge |
|---|---|
| Ablage | `ablage_lesen` · `ablage_ablegen` · `ablage_aktualisieren` (versioniert) |
| Erzeuger | `erzeuger_beauftragen` · `erzeuger_status` |
| Reminder | `cockpit_reminder` (setzen mit `in_minuten`, lesen, erledigen) |
| Kontakte | `kontakte_lesen` (Revier betrieb) · `kontakte_anreichern` (Revier person) |
| Betrieb | `operation` · `koordination` · `druckpunkt` · `monitor` · `lage` · `ueberbrueckung` · `verhandlung` · `blast` |
| Wissen | `search_wissen` · `pin_to_wissen` · `get_doc` · `grep` · `read_file` · `list_dir` |

**Was es bewusst NICHT gibt:** `freigeben`. Kein Werkzeug erklärt ein Stück
für fertig — das ist Markus' Wisch in der Werkstatt.

## Die anderen MCPs
- **Playwright** — eigener Browser: Screenshots, Klicks, synthetische Gesten.
  Für UI-Prüfung (siehe Skill `ui-pruefung`).
- **Chrome (Claude in Chrome)** — Markus' echter Browser mit seinen Sessions.
  Für alles hinter Login. GIF-Aufnahme für Animationen.
- **Firecrawl** — Webseiten holen und in Markdown wandeln. Instagram/Facebook
  werden verweigert (Anbieter-Sperre).
- **Apify** — Scraper-Plattform. Für das, was Firecrawl nicht darf
  (Google-Reviews, Instagram-Metadaten). **Kostet Guthaben — vorher fragen.**

## Die Kostenregel (D-31.07-ABO-GESETZ)
> „Alle Agenten laufen über Abo, ich will keinen Cent extra bezahlen."

- **Agenten/Erzeuger:** Claude Code headless mit `CLAUDE_CODE_OAUTH_TOKEN`
  (Max-Abo). Auf der Läufer-Maschine existiert **kein API-Schlüssel** — und
  der Code löscht ihn zusätzlich, falls doch einer auftaucht.
- **Cockpit-API (Alt-Bestand):** KAIRO-Classify und `/api/kopf` laufen noch
  über den API-Schlüssel — Centbeträge, stehen auf der Abriss-Liste.
- **Werkzeuge mit eigenem Preis** (Apify, Higgsfield): erst fragen.
- **KI-Tool-Budget:** 20 €/Monat. Infrastruktur separat (Fly ~6 €, Vercel,
  Supabase).

## Wenn ein Bild oder ein Video verstanden werden muss
Video: mit `curl` laden, `ffmpeg -vf fps=1/3` in Einzelbilder zerlegen, die
Bilder **selbst lesen**. Kostet nichts und funktioniert auch dort, wo
Transkription scheitert (bewährt am 31.07. an einem Instagram-Reel).

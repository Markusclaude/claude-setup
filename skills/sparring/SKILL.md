---
name: sparring
description: Markus will eine Situation durchspielen — Verhandlung, schwieriges Gespräch, Pitch. Claude zieht den Kontext aus der Cockpit-Ablage und spielt den Kontrahenten. Auslöser; "Sparring", "spiel den...", "lass uns durchspielen".
---

# Sparring — Kontext rein, Gegner raus

*Entstanden 30.07.2026. Ersetzt den Sparring-Raum (abgerissen) und die
ODS-Simulation. Markus: „Mit deiner Latenz und Wissen sowie die ganzen
Markdowns plus den Dokus ist alles möglich. Wenn ich was durchspielen
will, ziehst du den Kontext und spielst meinen Kontrahenten."*

## Ablauf

**1 · Kontext ziehen — IMMER zuerst, nie raten.**
Über die Cockpit-Steckdose (`mcp.cockpitport.com`):
- `cockpit_ablage_lesen` mit der passenden Vorhaben-Mappe (z. B. `kueche-allmer`
  für den Fischlieferanten) — Stand, Wände, bisherige Stücke
- `cockpit_ablage_lesen {mappe:"waende"}` — was jeden Entwurf begrenzt
  (150 Gedecke, Konditionen, Backtag …)
- `cockpit_get_dossier` falls es zum Kontrahenten noch ein Dossier gibt
  (stirbt, sobald der Kontakte-Konnektor steht — dann Kontakt statt Dossier)
- Wissen bei Bedarf: `cockpit_search_wissen` (Chris Voss liegt dort)

**2 · Rollenvertrag ansagen, dann spielen.**
Ein Satz vorab: wer ich bin, was mein Interesse ist, wie hart ich spiele.
Dann IN DER ROLLE bleiben. Realistisch, nicht gefällig — ein Kontrahent,
der sofort nachgibt, trainiert nichts. Einwände aus dem echten Kontext
(Preise, Termine, Historie), nicht aus dem Lehrbuch.

**3 · Debrief nur auf Ansage** („Debrief", „Auswertung", „genug").
Kurz: was saß, wo er verwundbar war, EIN konkreter nächster Zug.

**4 · Ablegen.**
Das Debrief als Stück in die zugehörige Vorhaben-Mappe:
`cockpit_ablage_ablegen { mappe, name: "Sparring · <Gegner> · <Datum>",
art: "sparring", ursprung: "claude", zustand: "fest" }` —
`fest`, nicht `wartet`: ein Debrief ist Ereignis, kein Entwurf.

## Wände

- Kein „Notiert, Sir" ins Leere: jedes Sparring endet mit Stück in der Mappe.
- Persona-Erkenntnisse (wiederkehrende Muster über mehrere Sessions) gehören
  zusätzlich ins lebende Portrait (`cockpit_ablage_aktualisieren` auf das
  Persona-Stück) — versioniert, nie überschrieben.
- Physis/Koerper-Themen tauchen im Sparring nicht auf — Revier `person`.

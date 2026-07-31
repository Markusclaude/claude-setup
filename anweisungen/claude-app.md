# Die Anweisung für die Claude-App (Projekt „Cockpit")

*Stand 31.07.2026 · D-30.07-CLAUDE-IST-DIE-QUELLE*

Diese eine Anweisung steht im Claude-App-Projekt. Sie ist bewusst **kurz** —
alles Weitere holt sich Claude selbst aus Cockpit.

---

```
Rufe zu Beginn jeder Session cockpit_zuhause auf und folge DEM PROTOKOLL,
das es zurückgibt. Cockpit ist dein Zuhause: dort steht, wer Markus ist,
woran er arbeitet, was wartet und wie du mit ihm umgehst.
```

---

## Warum nur ein Satz

Eine lange Projekt-Anweisung veraltet in dem Moment, in dem sie geschrieben
ist — und niemand merkt es. `cockpit_zuhause` liefert stattdessen den
**lebenden** Stand: DAS PROTOKOLL zuerst (Stimme, Griff-Tabelle,
Beziehungsmodell, Grenzen), dann Über-Markus, Projekte und Stände, was auf
sein Urteil wartet, die jüngsten Ereignisse und die Wiener Zeit.

Ändert sich etwas an der Arbeitsweise, wird DAS PROTOKOLL in Cockpit
geändert — nicht diese Datei. Sie beschreibt nur den Einstiegspunkt.

## Was verbunden sein muss

- **Konnektor:** `https://mcp.cockpitport.com/api/mcp` (33 Werkzeuge)
- **Prüfung, ob es steht:** frag Claude „Was wartet gerade auf mich?" —
  kommt eine konkrete Antwort mit Namen und Datum, ist die Verbindung da.
  Kommt eine Ausrede, ist der Konnektor abgelaufen.

## Die Grenzen, die immer gelten

- **Nach draußen geht nichts.** Kein Mail, kein Post, keine Nachricht an
  Dritte — Claude erzeugt Entwürfe, Markus sendet.
- **`fertig` entsteht nur durch Markus.** Kein Werkzeug darf ein Stück für
  fertig erklären; das ist sein Wisch in der Werkstatt.
- **Revier `person`** (Garmin, Physis, Familie) ist für Werkzeuge gesperrt,
  bis Markus es ausdrücklich öffnet.

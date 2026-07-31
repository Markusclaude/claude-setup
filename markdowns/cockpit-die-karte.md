# Cockpit — die Karte

*Was das System ist, in einer Seite. Stand 31.07.2026.*
*(Die lebende Wahrheit steht in Cockpit selbst — `cockpit_zuhause`.
Diese Datei ist die Übersicht für unterwegs, wenn kein Mac da ist.)*

## Die Arbeitsteilung
> **Cockpit** gibt Infos und saugt Infos auf — Markdowns rein, Markdowns und
> fertige PDF-Konzepte raus. Schnelle Ansicht, Speicher für alles, Ablage mit
> den laufenden Projekten.
> **Konstruiert wird mit Claude** — Chat, Cowork oder Code.

Claude ist der Kopf. Cockpit sind Arme, Beine und Augen. **Nicht der Mund.**

## Die vier Flächen (cockpitport.com, App mit vier Reitern)
| Fläche | Natur | Zeigt |
|---|---|---|
| **Brücke** | ZEIT | Lagesatz, Field Command (Body Battery, Fenster), Wartet, Häuser, DER STROM (7 Tage Bewegung) |
| **Bühne** | JETZT | nur fällige Reminder (Wisch wirkt) + zweite Tiefe: die Agenten |
| **Ablage** | WERKSTATT | Werkbank: Entwurf → Dein Auge → Fertig; Mappen der Vorhaben |
| **Speicher** | GEDÄCHTNIS | Portrait (Jahresringe), Menschen, Orte, Wissen, Chronik |

## Die Grammatik der Ablage
Jedes Stück trägt einen Umschlag: **Mappe · Art · Datum · Ursprung · Zustand**.

- **Zustände:** `wartet` (braucht Markus' Urteil) → `fertig` (nur durch seinen
  Wisch) · `fest` (Ereignis, wandelt sich nie).
- **Regale:** `vorhaben` (Werkstatt) · `ueber` + `wissen` (Speicher).
- **Versionen:** Jede Änderung sichert die Vorfassung. Nichts geht verloren.
- **Reviere:** `betrieb` (Werkzeuge dürfen) · `person` (Garmin, Physis,
  Familie — gesperrt, bis Markus öffnet).

## Der Erzeuger (die Agenten)
Ein gesprochener Satz wird Arbeit: `erzeuger_beauftragen` → Warteschlange →
Läufer auf Fly (Claude Code headless, Max-Abo) → Websuche + Steckdose →
Ergebnis als **wartet-Stück** → Richter prüft → Quittung mit Negativ-Teil.

**Die drei Zusagen:** kann nicht senden · kann nicht durchdrehen (Caps) ·
kann nicht schweigen (Herzschlag, Wächter alle 30 min).

**Die Agenten selbst** sind Stücke in der Mappe `agenten`: Takt, Zustand,
Auftrag — von Markus änderbar, ohne Code.
Heute an: **Aurora** (täglich 05:00) · **Bewertungs-Puls** (montags) ·
**Nacht-Destillat** (sonntags).

## Wo was liegt
- Web: `cockpitport.com` (Vercel) · Steckdose: `mcp.cockpitport.com/api/mcp`
- Code: `github.com/Markusclaude/cockpit` · Läufer: `~/Code/cockpit-erzeuger` (Fly)
- App: `~/Documents/CockpitApp` (Swift, vier Reiter, Wake Word, Schlüsselbund-Sitzung)
- Einrichtung: dieses Repo

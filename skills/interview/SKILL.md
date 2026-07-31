---
name: interview
description: Eine Kontextlücke über Markus' Welt füllen — Claude fragt, Markus diktiert, das Ergebnis wird als Stück in die Ablage gelegt. Auslöser; "Interview", "frag mich aus", "füll die Lücke zu X", oder wenn Claude wiederholt an derselben fehlenden Information scheitert.
---

# Das Interview — Kontext aus Markus' Mund statt aus Claudes Raten

*Nach Remys Methode (Kontextdateien per Claude-Interview + Diktat erzeugt,
wissen/ai-praxis). Die Cockpit-Regel dazu ist älter: eine geratene Angabe
ehrlich zu kennzeichnen macht sie nicht zulässig — und Schema-Fakten werden
selbst ermittelt, nur URTEILE und GELEBTES gehören Markus. Das Interview ist
für Letzteres.*

## Wann

- Eine Mappe in „Über dich" ist dünn (Persona, Wände eines Bereichs, Sprache)
- Ein neues Vorhaben startet und die Wände fehlen (wie beim Menüplan: erst
  Wände, Gewohnheiten, Richtung — sonst wird jeder Entwurf eine Kopiermaschine)
- Vor dem Kontakte-Konnektor: Rollen/Charakter wichtiger Kontakte

## Ablauf

**1 · Lücke benennen.** Ein Satz: was ich nicht weiß und wofür ich es brauche.

**2 · Fragen in Serien von DREI.** Nie mehr auf einmal — Markus diktiert
unterwegs, kurze Serien sind beantwortbar. Konkret statt offen: nicht „erzähl
mir von der Küche", sondern „was geht an einem schlechten Samstag raus, was
an einem guten?". Nachhaken, wenn eine Antwort eine Zahl schuldig bleibt.

**3 · Zwischenstand spiegeln.** Nach jeder Serie: „Verstanden als: …" in
zwei Zeilen. Markus korrigiert billig, solange es warm ist.

**4 · Ablegen, getrennt nach Natur:**
- **Wände** (harte Grenzen, Zahlen) → Mappe `waende`, `art: wand`, `fest`
- **Gewohnheiten** (was immer so läuft) → `art: gewohnheit`, `fest`
- **Persona/Sprache** → lebendes Stück via `ablage_aktualisieren` (versioniert)
- **Ereignisse** (Erfolge, Geschichten) → eigenes Stück, `fest`, nie anfassen

**5 · Vorlesen lassen.** Das Ergebnis geht einmal durch Markus' Auge, bevor
es als Wahrheit gilt — Interview-Antworten sind Diktat, Diktat kann irren.

## Wände

- Maximal ~15 Minuten pro Sitzung; lieber zwei kurze als eine zähe.
- Körper/Gesundheit nur, wenn Markus es ausdrücklich öffnet — Revier person,
  und dafür fehlt der Ablage-Weg noch.
- Nichts aus dem Interview verlässt die Ablage Richtung außen. Innen alles,
  außen nichts.

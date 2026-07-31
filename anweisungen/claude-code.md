# Die Anweisung für Claude Code

*Stand 31.07.2026*

Claude Code liest beim Start `CLAUDE.md` des jeweiligen Repos. Für Cockpit
steht dort die Ladeanweisung (Reihenfolge der Dokus, die drei Regeln,
Mobile-Modus, Bau-Hygiene) — sie lebt **im Cockpit-Repo**, nicht hier.

Was HIER steht, ist, was für ALLE Repos gilt:

## Die drei Regeln
1. **Zuerst besprechen, dann bauen.** Kein Code ohne ausdrückliches Go.
2. **Verifikation gegen Code.** Grep und lies, bevor du schreibst — die
   Doku kann stale sein, der Code ist die Wahrheit.
3. **tsc vor Commit.** Kein Push mit rotem tsc.

## Die Skills
Liegen in `~/.claude/skills/` (gespiegelt aus `skills/` dieses Repos):
`menueplan` · `sparring` · `rat` · `interview` · `ui-pruefung` ·
`geraetetest` · `wakeword-lauf`.

Wird ein Ablauf korrigiert, wandert die Korrektur in den Skill —
nicht nur in die Antwort (Prinzip: Abläufe paketieren, nicht wiederholen).

## Cockpit erreichen
Über den MCP-Konnektor `cockpit` (siehe `einrichtung/neues-geraet.md`).
Erster Griff jeder Session, die mit Markus' Welt zu tun hat:
`cockpit_zuhause`.

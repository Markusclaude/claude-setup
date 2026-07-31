# CLAUDE-SETUP — die zweite Säule

*Markus Allmer · angelegt 31.07.2026*

Es müssen **zwei Dinge** stehen: **Cockpit** und **das Claude-Setup**.
Cockpit ist gesichert — es lebt in einem Repo, auf Vercel, in Supabase.
Das Setup lag bis heute verstreut auf einem einzigen Mac: Skills in einem
versteckten Ordner, Anweisungen in der Claude-App, MCP-Konfiguration an drei
Stellen. **Wäre der Mac gestorben, wäre es weg gewesen.**

Dieses Repo ist die Antwort: alles, was Claude zu *Markus' Claude* macht,
an einem Ort, versioniert, von überall erreichbar — auch wenn nur das Handy
lebt.

---

## Die Arbeitsteilung (Markus, 31.07.2026)

> **Cockpit** gibt Infos und saugt Infos auf — Markdowns rein, Markdowns und
> fertige PDF-Konzepte raus. Schnelle Ansicht, Speicher für alles, Ablage
> mit den laufenden Projekten.
>
> **Konstruiert wird mit Claude** — Chat, Cowork oder Code. Dort ist der
> Kopf, dort das Gespräch. Cockpit führt keine Gespräche.

Daraus folgt die Grenze zwischen diesem Repo und Cockpit:

| | **hier im Repo** | **in Cockpit (Ablage/Speicher)** |
|---|---|---|
| Natur | **Einrichtung** — wie Claude arbeitet | **Gedächtnis** — was Claude weiß |
| Ändert sich | selten, bewusst, mit Commit | ständig, im Gespräch, versioniert |
| Beispiele | Skills, Anweisungen, MCP-Konfig | Persona, Stände, Lagen, Projekte, Kontakte |
| Quelle der Wahrheit | dieses Repo | die Ablage (`cockpit_zuhause`) |

**Nichts wird doppelt geführt.** Wo dieses Repo etwas beschreibt, das in
Cockpit lebt, steht hier nur der *Zeiger* darauf — nie eine Kopie, die
veraltet.

---

## Was hier liegt

```
skills/         Die Abläufe, die Claude als Skill aufrufen kann.
                (menueplan, sparring, rat, interview, ui-pruefung,
                 geraetetest, wakeword-lauf)
anweisungen/    Was Claude in Chat, Cowork und Code als Erstes liest.
einrichtung/    Ein neues Gerät in Betrieb nehmen — Schritt für Schritt.
markdowns/      Freie Dokumente: Konzepte, Notizen, alles, was Claude
                lesen können soll, ohne dass es Cockpit-Gedächtnis ist.
```

## Wie es verbunden ist

- **Claude (App/Web):** GitHub-Konnektor auf dieses Repo — Claude liest
  Skills und Anweisungen direkt, auch vom Handy.
- **Claude Code:** liegt lokal unter `~/Code/claude-setup`; die Skills
  werden nach `~/.claude/skills/` gespiegelt (`einrichtung/skills-sync.sh`).
- **Cockpit:** kennt dieses Repo als Zeiger im Speicher — die Ablage sagt,
  wo die Einrichtung wohnt, kopiert sie aber nicht.

## Die eine Regel

**Keine Geheimnisse in diesem Repo.** Keine Tokens, keine Schlüssel, keine
Passwörter — auch nicht in Beispielen. Wo ein Schlüssel nötig ist, steht
`<HIER DEIN TOKEN>` und daneben, woher man ihn bekommt.

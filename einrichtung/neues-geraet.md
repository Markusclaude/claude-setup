# Ein neues Gerät in Betrieb nehmen

*Stand 31.07.2026 — der Weg von „nackter Rechner" zu „Markus' Claude".*

Der Sinn dieses Repos: Wenn der Mac stirbt, ist nichts verloren. Diese Datei
ist die Wiederherstellung.

## 1 · Claude Code installieren
```bash
npm install -g @anthropic-ai/claude-code
claude          # einmal anmelden (Max-Abo)
```

## 2 · Dieses Repo holen
```bash
git clone git@github.com:Markusclaude/claude-setup.git ~/Code/claude-setup
bash ~/Code/claude-setup/einrichtung/skills-sync.sh
```

## 3 · Cockpit anschließen (die Steckdose)
Claude Code, Cowork und die Claude-App sprechen über denselben Konnektor:

```
https://mcp.cockpitport.com/api/mcp
```

Für Claude Code als MCP-Server eintragen (Token aus dem Passwortspeicher,
NICHT hier im Repo):
```bash
claude mcp add --transport http cockpit https://mcp.cockpitport.com/api/mcp \
  --header "Authorization: Bearer <HIER DEIN MCP_TOKEN>"
```

## 4 · Cockpit selbst (nur wenn am System gebaut wird)
```bash
git clone git@github.com:Markusclaude/cockpit.git ~/Code/cockpit
cd ~/Code/cockpit && npm install
# .env.local kommt aus Vercel: npx vercel env pull .env.local
```

## 5 · Die Probe
Frag Claude: **„Was wartet gerade auf mich?"**
Kommt eine konkrete Antwort mit Namen und Datum — es steht.

## Was NICHT hierher gehört
Tokens, Schlüssel, Passwörter. Die leben im Passwortspeicher, in Vercel und
in Fly — nie in einem Repo.

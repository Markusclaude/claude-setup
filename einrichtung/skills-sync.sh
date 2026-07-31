#!/usr/bin/env bash
# Skills aus dem Repo in Claude Codes Skill-Ordner spiegeln.
# Das Repo ist die Wahrheit — ~/.claude/skills ist nur die Arbeitskopie.
set -euo pipefail
QUELLE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/skills"
ZIEL="$HOME/.claude/skills"
mkdir -p "$ZIEL"
rsync -a --delete "$QUELLE/" "$ZIEL/"
echo "Skills gespiegelt: $(ls "$ZIEL" | wc -l | tr -d ' ') Stück"

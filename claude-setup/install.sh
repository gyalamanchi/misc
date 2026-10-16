#!/usr/bin/env bash
# Installs the global Claude Code setup into ~/.claude
# Existing files are backed up to ~/.claude/backup-<timestamp>/ before being replaced.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude"
BACKUP="$DEST/backup-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$DEST/agents" "$DEST/skills"

backup() {
  local target="$1"
  if [ -e "$target" ]; then
    mkdir -p "$BACKUP/$(dirname "${target#$DEST/}")"
    cp -R "$target" "$BACKUP/${target#$DEST/}"
    echo "  backed up ${target#$DEST/}"
  fi
}

echo "Installing to $DEST"

# Global rules
backup "$DEST/CLAUDE.md"
cp "$SRC/CLAUDE.md" "$DEST/CLAUDE.md"

# Subagents
for f in "$SRC"/agents/*.md; do
  backup "$DEST/agents/$(basename "$f")"
  cp "$f" "$DEST/agents/"
done

# Skills
for d in "$SRC"/skills/*/; do
  name="$(basename "$d")"
  backup "$DEST/skills/$name"
  rm -rf "$DEST/skills/$name"
  cp -R "$d" "$DEST/skills/$name"
done

# Settings: don't overwrite an existing file, since it may hold your own config
if [ -e "$DEST/settings.json" ]; then
  echo "  settings.json already exists — left untouched. Merge from $SRC/settings.json by hand if you want it."
else
  cp "$SRC/settings.json" "$DEST/settings.json"
fi

echo "Done. Start a new Claude Code session and run /agents to confirm scout, planner and builder are listed."
if [ -d "$BACKUP" ]; then echo "Backups: $BACKUP"; fi

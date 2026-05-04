#!/bin/bash

WAYBAR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

STYLE="$WAYBAR_DIR/style.css"
DARK="$WAYBAR_DIR/style-dark.css"
LIGHT="$WAYBAR_DIR/style-light.css"

STATE_FILE="$HOME/.cache/waybar-theme"

mkdir -p "$HOME/.cache"

# lire état
current=$(cat "$STATE_FILE" 2>/dev/null || echo "dark")

echo "CURRENT = $current"

if [ "$current" = "dark" ]; then
  echo "switch → light"
  cp "$LIGHT" "$STYLE"
  echo "light" >"$STATE_FILE"
else
  echo "switch → dark"
  cp "$DARK" "$STYLE"
  echo "dark" >"$STATE_FILE"
fi

# restart propre AVEC style forcé
pkill waybar
waybar -s "$STYLE" &

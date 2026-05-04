#!/bin/bash

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

echo ""
echo "  antland — installing dotfiles"
echo "  ────────────────────────────"

configs=(
  hypr
  waybar
  rofi
  wlogout
  ghostty
  cava
  waypaper
  fastfetch
  fish
  nvim
  hyprpanel
  nwg-look
)

for dir in "${configs[@]}"; do
  # if it's a true folder => Backup
  if [ -d "$CONFIG/$dir" ] && [ ! -L "$CONFIG/$dir" ]; then
    mv "$CONFIG/$dir" "$CONFIG/$dir.bak"
    echo "  backed up ~/.config/$dir"
  fi

  rm -rf "$CONFIG/$dir"
  ln -s "$DOTFILES/$dir" "$CONFIG/$dir"
  echo "  ✓ $dir"
done

# Wallpapers
rm -rf "$HOME/Pictures/wallpaper"
ln -s "$DOTFILES/wallpapers" "$HOME/Pictures/wallpaper"
echo "  ✓ wallpapers"

echo ""
echo "  antland installed !"
echo ""

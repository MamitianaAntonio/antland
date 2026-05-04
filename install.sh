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

# grant scripts
chmod +x "$DOTFILES/waybar/scripts/waybar-theme-toggle.sh"

# Waybar theme — dark as default
cp "$DOTFILES/waybar/style-dark.css" "$CONFIG/waybar/style.css"
echo "  ✓ waybar theme set to dark"

# Wallpapers
rm -rf "$HOME/Pictures/wallpaper"
ln -s "$DOTFILES/wallpapers" "$HOME/Pictures/wallpaper"
echo "  ✓ wallpapers"

echo ""
echo "  antland installed !"
echo ""

# antland dotfiles hyrland 🌿

Antland is my personal dotfiles for Hyprland and working on Arch Linux. Featuring Waybar, Ghostty, Fish, Neovim, and more. Install with a single script.

## Prerequisites

Make sure you are on **Fedora** or **Arch Linux** with **Hyprland** installed and running on **Wayland**.

### Arch Linux

```bash
sudo pacman -S hyprland waybar rofi ghostty fish neovim cava swww waypaper hyprlock wlogout mako nautilus grim wl-clipboard network-manager-applet pavucontrol btop
```

#### AUR packages

```bash
yay -S hyprpanel nwg-look nwg-displays fastfetch
```


### Fedora

```bash
sudo dnf install hyprland waybar rofi fish neovim cava swww hyprlock mako nautilus grim wl-clipboard network-manager-applet pavucontrol btop fastfetch
```

#### Copr packages (equivalent of AUR on Fedora)

```bash
sudo dnf copr enable solopasha/hyprland
sudo dnf install hyprpanel nwg-look nwg-displays waypaper wlogout ghostty
```

---

## Installation

**1 — Clone the repo**

```bash
git clone https://github.com/antonio/antland ~/antland
```

**2 — Run the install script**

```bash
cd ~/antland
bash install.sh
```

The script will :
- Backup your existing configs to `~/.config/*.bak`
- Create symlinks from `~/.config` to this repo
- Link wallpapers to `~/Pictures/wallpaper`

---

## Structure
```bash
antland/
├── hypr/          # Hyprland, hyprlock, hyprpanel
├── waybar/        # Status bar
├── rofi/          # App launcher
├── ghostty/       # Terminal emulator
├── fish/          # Shell
├── nvim/          # Text editor
├── cava/          # Audio visualizer
├── waypaper/      # Wallpaper manager
├── mako/          # Notification daemon
├── nwg-look/      # GTK theme
├── fastfetch/     # System info
├── wallpapers/    # Wallpapers
└── install.sh     # Install script
```

---

## After install

Restart Hyprland or reboot to apply all changes.

```bash
hyprctl reload
```

---

## Credits

Built by [Mamitiana Antonio](https://github.com/MamitianaAntonio) — feel free to use and adapt.

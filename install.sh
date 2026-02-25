#!/usr/bin/env bash

set -e

echo "== Minimal Waybar Installer =="

REPO="https://github.com/atif-1402/minimal-waybar-themes.git"

# Check git
command -v git >/dev/null 2>&1 || { echo "git not found."; exit 1; }

# Check fzf
if ! command -v fzf >/dev/null 2>&1; then
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm fzf >/dev/null 2>&1
    elif command -v apt >/dev/null 2>&1; then
        sudo apt update >/dev/null 2>&1
        sudo apt install -y fzf >/dev/null 2>&1
    else
        echo "fzf not found. Install manually."
        exit 1
    fi
fi

tmp=$(mktemp -d)

echo "Cloning repository..."
git clone --depth 1 "$REPO" "$tmp" >/dev/null 2>&1

if [ ! -d "$tmp/waybar" ]; then
    rm -rf "$tmp"
    echo "Invalid repository structure."
    exit 1
fi

ver=$(find "$tmp/waybar" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort | fzf --prompt="Select Waybar Version > ")

[ -z "$ver" ] && rm -rf "$tmp" && exit 0

if [ -d "$HOME/.config/waybar" ]; then
    echo "Backing up existing Waybar config..."
    mv "$HOME/.config/waybar" "$HOME/.config/waybar.backup.$(date +%s)"
fi

mkdir -p "$HOME/.config/waybar"
cp -rf "$tmp/waybar/$ver/." "$HOME/.config/waybar"

echo "Installed version: $ver"

# Detect and make scripts executable
if find "$HOME/.config/waybar" -type f -name "*.sh" | grep -q .; then
    find "$HOME/.config/waybar" -type f -name "*.sh" -exec chmod +x {} \;
    echo "Scripts detected and made executable."
fi

rm -rf "$tmp"

# Restart Waybar silently
if command -v omarchy-restart-waybar >/dev/null 2>&1; then
    omarchy-restart-waybar >/dev/null 2>&1
else
    pkill waybar >/dev/null 2>&1 || true
    nohup waybar >/dev/null 2>&1 &
fi

echo "Installation complete!"
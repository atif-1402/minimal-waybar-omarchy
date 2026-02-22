#!/usr/bin/env bash

set -e

echo "== Minimal Waybar Installer =="

# Check fzf
if ! command -v fzf >/dev/null 2>&1; then
    echo "fzf not found. Installing..."
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm fzf
    elif command -v apt >/dev/null 2>&1; then
        sudo apt install -y fzf
    else
        echo "Unsupported package manager. Install fzf manually."
        exit 1
    fi
fi

# Select version
ver=$(find waybar -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | fzf --prompt="Select Waybar Version > ")

if [ -z "$ver" ]; then
    echo "No version selected. Exiting."
    exit 0
fi

# Backup existing config
if [ -d "$HOME/.config/waybar" ]; then
    echo "Backing up existing config..."
    mv ~/.config/waybar ~/.config/waybar.backup.$(date +%s)
fi

# Install
mkdir -p ~/.config/waybar
cp -rf waybar/$ver/. ~/.config/waybar

echo "Installed version: $ver"

# Restart Waybar
if command -v omarchy-restart-waybar >/dev/null 2>&1; then
    omarchy-restart-waybar
else
    pkill waybar && waybar &
fi

echo "Done!"
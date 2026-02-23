#!/usr/bin/env bash

set -e

echo "== Minimal Waybar Installer =="

REPO="https://github.com/atif-1402/minimal-waybar-themes.git"

# Check fzf
if ! command -v fzf >/dev/null 2>&1; then
    echo "fzf not found. Installing..."
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm fzf
    elif command -v apt >/dev/null 2>&1; then
        sudo apt install -y fzf
    else
        echo "Unsupported package manager. Please install fzf manually."
        exit 1
    fi
fi

# Create temp directory
tmp=$(mktemp -d)

echo "Cloning repository..."
git clone --depth 1 "$REPO" "$tmp" >/dev/null 2>&1

if [ ! -d "$tmp/waybar" ]; then
    echo "Error: waybar directory not found in repo."
    rm -rf "$tmp"
    exit 1
fi

# Select version
ver=$(find "$tmp/waybar" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort | fzf --prompt="Select Waybar Version > ")

if [ -z "$ver" ]; then
    echo "No version selected. Exiting."
    rm -rf "$tmp"
    exit 0
fi

# Backup existing config
if [ -d "$HOME/.config/waybar" ]; then
    echo "Backing up existing Waybar config..."
    mv "$HOME/.config/waybar" "$HOME/.config/waybar.backup.$(date +%s)"
fi

# Install selected version
mkdir -p "$HOME/.config/waybar"
cp -rf "$tmp/waybar/$ver/." "$HOME/.config/waybar"

echo "Installed version: $ver"

# Cleanup
rm -rf "$tmp"

# Restart Waybar
if command -v omarchy-restart-waybar >/dev/null 2>&1; then
    omarchy-restart-waybar
else
    pkill waybar 2>/dev/null || true
    waybar &
fi

echo "Installation complete!"

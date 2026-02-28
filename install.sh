#!/usr/bin/env bash

set -euo pipefail

REPO="https://github.com/atif-1402/minimal-waybar-themes.git"
CONFIG_DIR="$HOME/.config/waybar"
TMP_DIR=$(mktemp -d)

# ===== Cleanup temp folder =====
cleanup() {
    rm -rf "$TMP_DIR" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

# ===== Dependency Check =====
for cmd in git gum; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo
        echo "Missing dependency: $cmd"
        echo
        echo "This is required to run the Waybar Theme Installer interface."
        echo "Please install it before continuing."
        echo
        echo "Example (Arch Linux): sudo pacman -S $cmd"
        echo
        exit 1
    fi
done

clear

gum style --border rounded --padding "1 4" --align center \
"Waybar Theme Installer"

echo
gum style "This will install a Waybar theme by atif-1402 on your system."
echo

# ===== Step 1 =====
gum style --foreground 212 "Step 1/4 — Downloading theme list..."

gum spin --spinner dot --title "Cloning repository..." -- \
    git clone --depth 1 "$REPO" "$TMP_DIR" >/dev/null 2>&1

if [ ! -d "$TMP_DIR/waybar" ]; then
    gum style --foreground 1 "Error: Could not fetch themes."
    exit 1
fi

# ===== Step 2 =====
gum style --foreground 212 "Step 2/4 — Choose a theme"

THEMES=$(find "$TMP_DIR/waybar" \
    -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort -V)

COUNT=$(echo "$THEMES" | wc -l)

theme=$(printf "%s\n" $THEMES | \
    gum choose --header "$COUNT themes available (scroll to view more)")

[ -z "$theme" ] && exit 0

# ===== Step 3 =====
gum style --foreground 212 "Step 3/4 — Installing $theme"

BACKUP_CREATED="no"

if [ -d "$CONFIG_DIR" ]; then
    BACKUP="$HOME/.config/waybar.backup.$(date +%s)"
    mv "$CONFIG_DIR" "$BACKUP"
    BACKUP_CREATED="yes"
fi

mkdir -p "$CONFIG_DIR"

gum spin --spinner dot --title "Copying files..." -- \
    cp -rf "$TMP_DIR/waybar/$theme/." "$CONFIG_DIR"

# Detect scripts
SCRIPT_COUNT=$(find "$CONFIG_DIR" -type f -name "*.sh" | wc -l)

if [ "$SCRIPT_COUNT" -gt 0 ]; then
    find "$CONFIG_DIR" -type f -name "*.sh" -exec chmod +x {} \;
    SCRIPTS_MESSAGE="Detected $SCRIPT_COUNT script file(s) and made them executable."
else
    SCRIPTS_MESSAGE="No scripts detected in this theme. You are good to go!."
fi

# ===== Step 4 =====
gum style --foreground 212 "Step 4/4 — Restarting Waybar"

# Kill safely
pkill -x waybar 2>/dev/null || true
sleep 0.5

# Restart properly depending on compositor
if command -v hyprctl >/dev/null 2>&1; then
    hyprctl dispatch exec waybar >/dev/null 2>&1
else
    nohup waybar >/dev/null 2>&1 &
fi

echo

FINAL_MESSAGE="Theme '$theme' installed successfully."

if [ "$BACKUP_CREATED" = "yes" ]; then
    FINAL_MESSAGE="$FINAL_MESSAGE

A backup of your previous configuration was created at:

$BACKUP"
fi

FINAL_MESSAGE="$FINAL_MESSAGE

$SCRIPTS_MESSAGE"

gum style --border rounded --padding "1 3" "$FINAL_MESSAGE"

echo
read -p "Press Enter to exit..."
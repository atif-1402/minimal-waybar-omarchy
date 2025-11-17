## Waybar Themes for Omarchy

This is the first waybar theme version and i try my best to update it and make more themes like this
<img width="1366" height="31" alt="image" src="https://github.com/user-attachments/assets/abe6a97e-c4d3-4159-aaa3-d1c19cd7d1c6" />


https://github.com/user-attachments/assets/ef6b1069-8943-4051-8e95-67a8c92baa36



## Basic features this waybar provide 
 - Minimal workspace switcher
 - Middle minimal clock
 - System Tray
 - Volume (pulseaudio) indicator
 - Media player - this is a custom module it requires playerctl
   ```bash
   sudo pacman -S playerctl
   ```
## Adjustment to accoring to your resolution

- The waybar can mess up in your display or resoultion try checking the config file and do some dimension related adjustment 
like adjusting this in config file
```bash
   {
    "layer": "top",
    "position": "top",
    "margin-top": 5,
    "width": 1250,
    "modules-left": ["hyprland/workspaces", "custom/media", "sway/mode"],
    "modules-center": ["clock"],
    "modules-right": ["tray", "pulseaudio" ],
    "sway/window": {
        "max-length": 50
    },
  ```
- By adjusting config a little you can attain a minimal look for your resoultion

## Making Media player work
![ezgif-54295365b2a3790a](https://github.com/user-attachments/assets/ee6b1982-560e-4a0f-b83f-57288c5c5370)
- As i said playerctl is required for this and a Script file i also added the media.sh file in waybar/media.sh 
- To make it work seamlessly you need Nerd Fonts for the play/pause icon in the media
- Place the media.sh folder in your waybar folder to work

## Installation
- I RECOMMEND TO BACKUP YOUR EXISTING WAYBAR FOLDER AND CONFIG
- First delete the config.jsonc and style.css from your Waybar folder then drop the download config.jsonc, style.css and media.sh file in waybar folder
- Finally kill and reload the waybar (for omarchy press Shift + Super + Space to kill waybar then same key again to reload)


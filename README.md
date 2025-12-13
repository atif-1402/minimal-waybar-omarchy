# Waybar Themes for Omarchy

## V1
This is the first waybar theme version and i try my best to update it and make more themes like this
<img width="1366" height="31" alt="image" src="https://github.com/user-attachments/assets/abe6a97e-c4d3-4159-aaa3-d1c19cd7d1c6" />


https://github.com/user-attachments/assets/ef6b1069-8943-4051-8e95-67a8c92baa36



### Basic features this waybar provide 
 - Minimal workspace switcher
 - Middle minimal clock
 - System Tray
 - Volume (pulseaudio) indicator
 - Media player - this is a custom module it requires playerctl
   ```bash
   sudo pacman -S playerctl
   ```
### Adjustment to accoring to your resolution

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

### Making Media player work
![ezgif-54295365b2a3790a](https://github.com/user-attachments/assets/ee6b1982-560e-4a0f-b83f-57288c5c5370)
- As i said playerctl is required for this and a Script file i also added the media.sh file in waybar/media.sh 
- To make it work seamlessly you need Nerd Fonts for the play/pause icon in the media
- Place the media.sh folder in your waybar folder to work


## V1.5
This the V1.5 version of my waybar done somework on it and added more things
<img width="1366" height="27" alt="image" src="https://github.com/user-attachments/assets/51abf517-08de-41c2-971d-711abad8cf2d" />

### What's New
   - added a custom omarchy menu and vicinae modules (i added both you can remove one)
   - No need of the script for media player anymore (using mpris)
   - Icons of where media is playing in media module
   - Poweroff module
   - seprate modules config from config.jsonc
   - You can switch between active workspace by scrolling on the workspace module
   - better clock
   - better tooltip (previewed only one there is more)

     <img width="562" height="153" alt="image" src="https://github.com/user-attachments/assets/8b34797d-6e70-4ca0-a7b5-7d670c727f61" />



### Adjustment to accoring to your resolution

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

  ### Suggetions
   - Use blur for waybar in your hyprland.conf
     ```bash
       layerrule = blur, waybar
       layerrule = ignorealpha 0.1, waybar
      ```

## V2
 The V2 waybar is based on Minimal and Material UI Theme
 <img width="1366" height="267" alt="image" src="https://github.com/user-attachments/assets/2dd3c353-f4e4-48bc-8158-3214b0b419d5" />
 <img width="1366" height="266" alt="image" src="https://github.com/user-attachments/assets/18fbb689-696f-43c2-b0e1-cc9b26177fa7" />

### Thanks to [@HANCORE-linux](https://github.com/HANCORE-linux) for helping me out and check out his waybar too!

### What's New
   - It look good as dock too you can try 
   - Completely changed the waybar
   - Using Pills like module to get Material UI
   - Added Window Module 
   - better clock
   - better tooltip 
     

# Installation
- I RECOMMEND TO BACKUP YOUR EXISTING WAYBAR FOLDER AND CONFIG
- First delete the config.jsonc and style.css from your Waybar folder then drop the download config.jsonc, style.css and other file in waybar folder
- Finally pkill and reload the waybar (for omarchy press Shift + Super + Space to kill waybar then same key again to reload)


## Minimal Waybar Themes 

## Compatibility
- These configs are Omarchy-based, including optional Omarchy-specific modules (logo, screen recorder, update module).
- Aside from that, they use standard modules so they can be used on any distro by simply removing the Omarchy modules and set your own color scheme.

## Installation
#### A backup of your current waybar created in ~/.config/waybar.bak.(timestamps) folder
#### Just run this command and select the version you want to install (fzf should be installed inorder to run the installer.)    
   ```
curl -s https://raw.githubusercontent.com/atif-1402/minimal-waybar-themes/main/install.sh | bash
```

## V1
This is the first waybar theme version and i try my best to update it and make more themes like this
<img width="1366" height="31" alt="image" src="https://github.com/user-attachments/assets/abe6a97e-c4d3-4159-aaa3-d1c19cd7d1c6" />

### Basic features this waybar provide 
 - Minimal workspace switcher
 - Middle minimal clock
 - System Tray
 - Volume (pulseaudio) indicator
 - Media player - this is a custom module it requires playerctl
   ```bash
   sudo pacman -S playerctl
   ```
   
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

## V2.4
 <img width="1366" height="287" alt="screenshot-2025-12-14_17-43-53" src="https://github.com/user-attachments/assets/902f489f-0760-435a-a41f-2372396f340e" />
 <img width="1366" height="289" alt="screenshot-2025-12-14_17-43-10" src="https://github.com/user-attachments/assets/389554ce-8205-4b8f-b5e5-460fe68dabbc" />

### What's New
   - Changed the workspace module
   - Uses Kanji Characters in Workspace
   - Added ease-in-out transition while switching workspaces 

## V3
 <img width="1366" height="210" alt="screenshot-2025-12-29_23-54-51" src="https://github.com/user-attachments/assets/bfb833ae-41a6-424a-b7cd-5048ac2aff3a" />
 <img width="1366" height="208" alt="screenshot-2025-12-29_23-55-31" src="https://github.com/user-attachments/assets/e17ba819-4af2-4e5b-9755-bd0c037f3f1a" />

### What's New
   - New Look
   - Roman Number Workspaces
   - Bottem Border in workspace with transition
   - More Stats Modules
   - Game Mode (Disable Hyprland Blur & Animations)

## V4
<img width="1366" height="236" alt="image" src="https://github.com/user-attachments/assets/021a4bdb-0e93-4789-a4da-23bb05ff0630" />
<img width="1366" height="240" alt="image" src="https://github.com/user-attachments/assets/ed1a8a5c-9f39-4d77-8fe4-4490a21896c6" />

### Make the window.sh executable by 
```
chmod +x ~/.config/waybar/window.sh
```

### What's New
   - New Look
   - Similar to end 4 dots bar
   - custom window.sh to grep active window (no hyprland/window module)
   - weather module automatically set location by your IP
   - custom media module (no mpris)
   - More!

### V4.x
<img width="1366" height="42" alt="image" src="https://github.com/user-attachments/assets/d54181c4-6023-4eda-9713-eb6a4abd11ea" />

   - Adjusted Workspaces and added transition
   - Added Gamemode
   - Cons are still same (working on it)

### Cons
   - <b>Only if you use light theme</b> you need to manually change the color for $esc_bottom in window.sh 
     ```bash
           text="<span size='7500' foreground='#a6adc8' rise='-2000'>$esc_top</span>
     <span size='9000' weight='bold' foreground='#ffffff'>$esc_bottom</span>"
      ```

## V5
<img width="1366" height="188" alt="image" src="https://github.com/user-attachments/assets/bead663a-aa9f-4499-bf99-852639def878" />
<img width="1366" height="179" alt="image" src="https://github.com/user-attachments/assets/1e5c7a18-93af-4ae4-8a4e-8f47a7f00e1b" />

### Make the window.sh executable by 
```
chmod +x ~/.config/waybar/window.sh
```

### What's New
   - New Look
   - Similar to AxOS bar
   - custom window.sh to grep active window (no hyprland/window module)
   - expandable groups to debloat and attain minimalism
   - More!
   - 
### Cons
   - <b>Only if you use light theme</b> you need to manually change the color for $esc_bottom in window.sh 
     ```bash
           text="<span size='7500' foreground='#a6adc8' rise='-2000'>$esc_top</span>
     <span size='9000' weight='bold' foreground='#ffffff'>$esc_bottom</span>"
      ```

## Adjustment for Laptop Users 
   - Sorry But i am a PC user and cant get my hands on battery, etc modules i try to fake it but it messed up so you need to configure those module by your own Sorry.


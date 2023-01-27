<div align="center">
    <img src="./assets/banner.png">
    <hr>
    <p> My personal dotfiles managed with <a href="https://www.chezmoi.io/">chezmoi</a>.
    </p>
    <a href="https://github.com/Battlesquid/dotfiles/stargazers">
        <img src="https://img.shields.io/github/stars/Battlesquid/dotfiles?color=577BB5&labelColor=1A1B26&style=for-the-badge">
    </a>
    <a href="../LICENSE.md">
        <img src="https://img.shields.io/github/license/Battlesquid/dotfiles?color=C0CAF5&labelColor=1A1B26&style=for-the-badge">
    </a>
</div>

### **NOTICE**
These dotfiles and the instructions on how to set them up are still under construction, and testing is still being done. Proceed with caution.

<br>

<img align="right" width="500px" src="./assets/umi1.png">

# **Details**

- **Window Manager** - [bspwm](https://github.com/baskerville/bspwm)
- **Compositor** - [picom](https://github.com/yshui/picom)
- **Shell** - [zsh](https://wiki.archlinux.org/title/zsh)
- **Terminal** - [kitty](https://github.com/kovidgoyal/kitty)
- **Bar and Widgets** - [eww](https://github.com/elkowar/eww)
- **Launcher** - [rofi](https://github.com/davatorium/rofi)
- **Notification Daemon** - [dunst](https://github.com/dunst-project/dunst)

# **Setup**

These setup steps use [paru](https://github.com/Morganamilo/paru), but feel free to use your AUR helper of choice.

### **WARNING:**

Be sure to back up any relevant files before continuing. Chezmoi will ask what you should do if a conflict occurs, but back up your files just in case. You can see what will be applied at a glance with `chezmoi status` and `chezmoi diff`.

## **Single Line Installation**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Battlesquid/dotfiles/umi/install.sh)"
```

## **Manual Installation**

Install dependencies:
```bash
paru -S chezmoi xorg bspwm picom-animations-git eww rofi dunst pamixer xorg-xinit inter-font ttf-firacode-nerd networkmanager brightnessctl cava neofetch sxhkd betterlockscreen flameshot feh playerctl jq recode moreutils xqp xdo zsh
```

Fetch the dotfiles using:
```bash
chezmoi init --branch umi https://github.com/Battlesquid/dotfiles.git
```

Confirm the changes that will be made.
```bash
chezmoi diff
```

Install with:
```bash
chezmoi apply -v
```

Install the icon font:
```bash
mv ~/.config/fonts/Material_Symbols_Rounded_Filled_20pt_Bold.ttf ~/.local/share/fonts/
```

Logout of your session and then start with:
```bash
startx
```

## **Custom Installation**

If you wish to manually move/symlink/view the dotfiles source, you can generate an archive of the source. For example:

```bash
chezmoi cd
chezmoi --source-path archive src/**/* --output=~/dotconfig.tar.gz
```

The archive will be in your home directory. This can be done with any folder/file in the source directory, so you can choose how to build out your archive. You can see a full list of potential archive targets with `chezmoi managed`.

## **Miscellaneous**

### **Weather widget**

1. [Grab an OpenWeather API key](https://openweathermap.org/api). Also determine the [city](https://openweathermap.org/current#name) you would like to use.
2. Create a `secrets` file with:
```
touch ~/.config/eww/umi/scripts/secrets
```
3. Copy the contents below into the secrets file, substituting in the API key and city.
```bash
#!/bin/sh

WEATHER_API_KEY="<YOUR_API_KEY_HERE>"
WEATHER_API_CITY="<YOUR_CITY_HERE>"
```
### **Updating**

To apply updates:
```bash
chezmoi update
```

# **Credits**

Feel free to use anything in this repo, just be sure to provide proper credit.

Some scripts/config files were borrowed/adapted from the following repos:
- [adi1090x/widgets](https://github.com/adi1090x/widgets)
- [Syndrizzle/hotfiles](https://github.com/Syndrizzle/hotfiles)
- [saimoomedits/eww-widgets](https://github.com/saimoomedits/eww-widgets)
- [janleigh/dotfiles](https://github.com/janleigh/dotfiles)

# **Contributing**

If you find a problem/inconsistency that can be improved without fundamentally changing the configuration (i.e., fixing a script to handle an edge-case), feel free to open an issue or PR.

<hr>
<div align="center">
    <img src="./assets/montage.png">
</div>

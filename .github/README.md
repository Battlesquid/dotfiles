<div style="text-align: center;">
    <img src="./assets/dotfiles.png">
</div>

<hr>

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

### **NOTICE**
These dotfiles and the instructions on how to set them up are still under construction, and testing is still being done. Proceed with caution.

<br>

# **Details**

- **Window Manager** - [bspwm](https://github.com/baskerville/bspwm)
- **Compositor** - [picom](https://github.com/yshui/picom)
- **Shell** - [zsh](https://wiki.archlinux.org/title/zsh)
- **Terminal** - [kitty](https://github.com/kovidgoyal/kitty)
- **Bar and Widgets** - [eww](https://github.com/elkowar/eww)
- **Launcher** - [rofi](https://github.com/davatorium/rofi)
- **Notification Daemon** - [dunst](https://github.com/dunst-project/dunst)

# **Setup**

Grab chezmoi using a package manager of your choice. Assuming you have [paru](https://github.com/Morganamilo/paru):

```
paru -S chezmoi
```


Fetch the dotfiles using:
```
chezmoi init https://github.com/Battlesquid/dotfiles.git
```

## **Installation**
### **WARNING**

Be sure to back up any relevant files before continuing. Chezmoi will ask what you should do if a conflict occurs, but back up your files just in case. You can see what will be applied at a glance with `chezmoi status` and `chezmoi diff`.


### **Dependencies**

Assuming you have [paru](https://github.com/Morganamilo/paru) installed:
```
paru -S xorg bspwm picom-animations-git kitty eww-git rofi dunst redshift pamixer xorg-xinit networkmanager noto-fonts nerd-fonts-noto-sans-mono ttf-font-awesome brightnessctl cava glava neofetch neovim sxhkd betterlockscreen flameshot feh playerctl jq recode moreutils jgmenu xcolor
```

### **Installation**

Confirm the changes that will be made.
```
chezmoi diff
```

Install with:
```
chezmoi apply -v
```

If you are running this on a clean system or you want to run everything with a single command, you can run condense this into one command:

```
chezmoi init --apply https://github.com/Battlesquid/dotfiles.git
```

Logout of your session and then start with:
```
startx
```

## **Manual Installation**

If you wish to manually move/symlink/view the dotfiles source, you can generate an archive of the source. For example:

```
chezmoi cd
chezmoi --source-path archive src/**/* --output=~/dotconfig.tar.gz
```

The archive will be in your home directory. This can be done with any folder/file in the source directory, so you can choose how to build out your archive. You can see a full list of potential archive targets with `chezmoi managed`.

## **Miscellaneous**

### **eww weather widget**

1. [Grab an OpenWeather API key](https://openweathermap.org/api). Also determine the [city](https://openweathermap.org/current#name) you would like to use.
2. Create the following file:
```
touch ~/.config/eww/fool_moon/common/scripts/secrets
```
3. Copy the contents below into the secrets file, substituting in the API key and city.
```
#!/bin/sh

WEATHER_API_KEY="<YOUR_API_KEY_HERE>"
WEATHER_API_CITY="<YOUR_CITY_HERE>"
```

# **Credits**

Feel free to use anything in this repo, just be sure to provide proper credit.

Some scripts/config files were borrowed/adapted from the following repos:
- [adi1090x/widgets](https://github.com/adi1090x/widgets)
- [Syndrizzle/hotfiles](https://github.com/Syndrizzle/hotfiles)
- [mmsaeed509/bspwm-dots](https://github.com/mmsaeed509/bspwm-dots)
- [saimoomedits/eww-widgets](https://github.com/saimoomedits/eww-widgets)

# **Contributing**

Since these are my dotfiles, I will not review/implement changes that fundamentally change how the configuration is set up. However, if you find a problem/inconsistency that can be improved without fundamentally changing the configuration (i.e., fixing a script to handle an edge-case), feel free to open an issue or PR.


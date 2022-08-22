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

<br>

# Setup

## **Full Installation**
### **WARNING**

Be sure to back up any relevant files before continuing. Chezmoi will ask what you should do if a conflict occurs, but back up your files just in case. You can see what will be applied at a glance with `chezmoi status` and `chezmoi diff`.


### **Dependencies**

Assuming you have [paru](https://github.com/Morganamilo/paru) installed:
```
paru -S bspwm picom-animations-git kitty eww-git rofi dunst chezmoi redshift pamixer xorg-xinit networkmanager noto-fonts ttf-font-awesome brightnessctl cava neofetch neovim sxhkd slock flameshot lxappearance-gtk3 feh playerctl jq recode moreutils
```

Fetch the dotfiles using:
```
chezmoi init https://github.com/Battlesquid/dotfiles.git
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

<br>

## **Partial Installation**

### **WARNING** - needs more testing

You can install the dotfiles partially if you wish using the `partial.sh` helper script in this repo. 

`cd` into `~/.local/share/chezmoi` or use `chezmoi cd` to use the script. If, for example, you wanted to only install the relevant dotfiles for the eww configuration you would do:

```
./partial.sh eww
```

See `./partial usage` for a full list of partial options.


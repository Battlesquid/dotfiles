<div align="center">
    <img src="./assets/dotfiles.png">
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

<br>

<img align="right" width="500px" src="./assets/output_dash.png">

# **Details**

- **Distribution** - [Arch Linux](https://archlinux.org)
- **Window Manager** - [bspwm](https://github.com/baskerville/bspwm)
- **Compositor** - [picom](https://github.com/yshui/picom)
- **Shell** - [zsh](https://wiki.archlinux.org/title/zsh)
- **Terminal** - [kitty](https://github.com/kovidgoyal/kitty)
- **Bar and Widgets** - [eww](https://github.com/elkowar/eww)
- **Launcher** - [rofi](https://github.com/davatorium/rofi)
- **Notification Daemon** - [dunst](https://github.com/dunst-project/dunst)

# **Setup**

- These setup steps use [`paru`](https://github.com/Morganamilo/paru). The single line installation will add `paru` if it's missing. However, it is not a required dependency, so feel free to use your AUR helper of choice if you do manual installation.
- These setup steps assume you at least have a [minimal install](https://wiki.archlinux.org/title/installation_guide) of Arch Linux.

### **WARNING:**

Be sure to back up any relevant files before continuing. Chezmoi will ask what you should do if a conflict occurs, but back up your files just in case. You can see what will be applied at a glance with `chezmoi status` and `chezmoi diff`.

## **Single Line Installation**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Battlesquid/dotfiles/main/install.sh)"
```

## **Manual Installation**

Install dependencies:
```bash
paru -S chezmoi xorg xorg-xinit bspwm sxhkd compfy kitty eww-git rofi dmenu dunst redshift pamixer networkmanager noto-fonts ttf-firacode-nerd ttf-noto-nerd ttf-font-awesome noto-fonts-cjk noto-fonts-emoji brightnessctl cava glava neofetch neovim betterlockscreen flameshot feh playerctl jq recode moreutils jgmenu xcolor xqp xdo zsh xdg-user-dirs bluez bluez-utils blueman nemo nemo-fileroller discord firefox spotify-launcher noisetorch-bin obs-studio visual-studio-code-bin capitaine-cursors btop python
```

Start bluetooth service:
```bash
if ! [ $(lsmod | grep -wq "^btusb") ];then
    sudo modprobe btusb
fi
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
```

Change your shell to `zsh`
```bash
chsh -s /usr/bin/zsh
zsh
```

Create script files for aliases and PATH additions. These are sourced in `~/.zshrc`, and can be used for adding personal `zsh` configuration without fear of them being overriden when running `chezmoi update`.
```zsh
touch ~/.aliases.zsh
touch ~/.path.zsh
```

Install [`oh-my-zsh`](https://ohmyz.sh/#install)
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install [powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Fetch the dotfiles using:
```zsh
chezmoi init https://github.com/Battlesquid/dotfiles.git
```

Confirm the changes that will be made.
```zsh
chezmoi diff
```

Install with:
```zsh
chezmoi apply -v
```

Add [icon theme]( https://github.com/vinceliuice/Tela-icon-theme)
```zsh
mkdir ~/repos
git clone https://github.com/vinceliuice/Tela-icon-theme.git ~/repos/tela-icon-theme
chmod +x ~/repos/tela-icon-theme/install.sh
~/repos/tela-icon-theme/install.sh nord
```

Add [GTK theme](https://github.com/Battlesquid/gtk)
```zsh
git clone https://github.com/Battlesquid/gtk.git ~/repos/fool-moon-phocus
cd ~/repos/fool-moon-phocus
make
make install
```

Create home directories
```zsh
xdg-user-dirs-update
```

If you're logged into a session, logout, then start with:
```zsh
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
touch ~/.config/eww/fool_moon/common/scripts/secrets
```
3. Copy the contents below into the secrets file, substituting in the API key and city.
```bash
#!/bin/sh
WEATHER_API_KEY="<YOUR_API_KEY_HERE>"
WEATHER_API_CITY="<YOUR_CITY_HERE>"
```

### **GTK theme and icons**

You can acess the GTK theme I made for this rice [here](https://github.com/Battlesquid/gtk). I use the [Tela](https://github.com/vinceliuice/Tela-icon-theme) icon theme (nord, gray variant).

### **Side Menu Fix (experimental)**

You might notice that the side menu on the right is either too long or too short. This is due to your monitor resolution. To fix this, run:

```zsh
~/.config/eww/fool_moon/windows/side-menu/eww_side_menu_fix
```

# **Credits**

Feel free to use anything in this repo, just be sure to provide proper credit.

Some scripts/config files were borrowed/adapted from the following repos:
- [adi1090x/widgets](https://github.com/adi1090x/widgets)
- [Syndrizzle/hotfiles](https://github.com/Syndrizzle/hotfiles)
- [mmsaeed509/bspwm-dots](https://github.com/mmsaeed509/bspwm-dots)
- [saimoomedits/eww-widgets](https://github.com/saimoomedits/eww-widgets)
- [janleigh/dotfiles](https://github.com/janleigh/dotfiles)

# **Contributing**

Found an issue? Feel free to [add an issue](https://github.com/Battlesquid/dotfiles/issues) or [create a PR](https://github.com/Battlesquid/dotfiles/pulls) to resolve it, and I'll look at it at my earliest convenience.

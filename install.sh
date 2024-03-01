#!/bin/bash

if ! command -v paru &> /dev/null; then
    echo "Installing paru"
    sudo pacman -S --needed base-devel
    sudo pacman -S git rustup
    rustup default stable
    mkdir "$HOME/repos"
    cd "$HOME/repos"
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd "$HOME"
fi

echo "Installing dependencies"
paru -S chezmoi xorg xorg-xinit bspwm sxhkd compfy kitty eww-git rofi dmenu dunst redshift pamixer networkmanager noto-fonts ttf-firacode-nerd ttf-noto-nerd ttf-font-awesome noto-fonts-cjk noto-fonts-emoji brightnessctl cava glava neofetch neovim betterlockscreen flameshot feh playerctl jq recode moreutils jgmenu xcolor xqp xdo zsh xdg-user-dirs bluez bluez-utils blueman nemo nemo-fileroller discord firefox spotify-launcher noisetorch-bin obs-studio visual-studio-code-bin capitaine-cursors btop python sass

echo "Starting services"

if ! [ $(lsmod | grep -wq "^btusb") ];then
    sudo modprobe btusb
fi
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

echo "Changing shell to zsh"
chsh -s /usr/bin/zsh

echo "Pulling dotfiles"
chezmoi init --apply https://github.com/Battlesquid/dotfiles.git

touch ~/.config/eww/fool_moon/scripts/secrets

chezmoi cd

zsh -c zshinstall.zsh

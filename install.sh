#!/bin/bash
paru -S chezmoi xorg bspwm compfy kitty eww rofi dunst redshift pamixer xorg-xinit networkmanager noto-fonts nerd-fonts-noto-sans-mono-extended ttf-font-awesome brightnessctl cava glava neofetch neovim sxhkd betterlockscreen flameshot feh playerctl jq recode moreutils jgmenu xcolor bluez-utils xqp xdo zsh
chezmoi init --apply https://github.com/Battlesquid/dotfiles.git

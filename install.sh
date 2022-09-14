#!/bin/bash

paru -S chezmoi xorg bspwm picom-animations-git kitty eww-git rofi dunst redshift pamixer xorg-xinit networkmanager noto-fonts nerd-fonts-noto-sans-mono ttf-font-awesome brightnessctl cava glava neofetch neovim sxhkd betterlockscreen flameshot lxappearance-gtk3 feh playerctl jq recode moreutils jgmenu xcolor

chezmoi init --apply https://github.com/Battlesquid/dotfiles.git

#!/bin/bash
paru -S chezmoi xorg bspwm picom-animations-git eww rofi dunst pamixer xorg-xinit inter-font networkmanager brightnessctl cava neofetch sxhkd betterlockscreen flameshot feh playerctl jq recode moreutils xqp xdo zsh
chezmoi init --apply --branch "umi" https://github.com/Battlesquid/dotfiles.git

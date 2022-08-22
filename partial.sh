#!/bin/bash

function usage() {
    echo "USAGE: ./partial [eww|rofi|dunst|cava|kitty|neofetch|nvim|picom|sxhkd]"
}

function p_eww() {
    paru -S eww-git dunst redshift pamixer slock noto-fonts ttf-font-awesome brightnessctl playerctl jq recode moreutils
    mkdir -p ~/.config/eww/fool_moon
    mkdir -p ~.scripts
    chezmoi apply ~/.config/eww/fool_moon
    chezmoi apply ~/.scripts
}

function p_rofi() {
    paru -S rofi
    mkdir -p ~/.config/rofi/fool_moon
    chezmoi apply ~/.config/rofi/fool_moon
}

function p_dunst() {
    paru -S dunst
    mkdir -p ~/.config/dunst
    mkdir -p ~.scripts
    chezmoi apply ~/.config/dunst/dunstrc
    chezmoi apply ~/.scripts
}

function p_cava() {
    paru -S cava
    mkdir -p ~/.config/cava
    chezmoi apply ~/.config/cava/config
}

function p_kitty() {
    paru -S kitty
    mkdir -p ~/.config/kitty
    chezmoi apply ~/.config/kitty/kitty.conf
}

function p_neofetch() {
    paru -S neofetch
    mkdir -p ~/.config/neofetch
    chezmoi apply ~/.config/neofetch
}

function p_nvim() {
    paru -S neovim
    mkdir -p ~/.config/nvim
    chezmoi apply ~/.config/nvim
}

function p_picom() {
    paru -S picom-animations-git
    mkdir -p ~/.config/picom
    chezmoi apply ~/.config/picom/picom.ini
}

function p_sxhkd() {
    paru -S sxhkd
    mkdir -p ~/.config/sxhkd
    chezmoi apply ~/.config/sxhkd/sxhkdrc
}

case "$1" in
    "eww") p_eww;;
    "rofi") p_rofi;;
    "dunst") p_dunst;;
    "cava") p_cava;;
    "kitty") p_kitty;;
    "neofetch") p_neofetch;;
    "nvim") p_nvim;;
    "picom") p_picom;;
    "sxhkd") p_sxhkd;;
    "usage") usage;;
    *) echo "unrecognized command" && usage && exit 1;;
esac

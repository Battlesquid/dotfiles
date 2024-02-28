#!/bin/bash

if ! command -v paru &> /dev/null; then
    echo "Installing paru"
    sudo pacman -S --needed base-devel
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
zsh

touch ~/.aliases.zsh
touch ~/.path.zsh

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing oh-my-zsh-plugins"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing dotfiles"
chezmoi init --apply https://github.com/Battlesquid/dotfiles.git

touch ~/.config/eww/fool_moon/common/scripts/secrets

echo "Installing icon theme"

git clone https://github.com/vinceliuice/Tela-icon-theme.git ~/repos/tela-icon-theme
chmod +x ~/repos/tela-icon-theme/install.sh
~/repos/tela-icon-theme/install.sh -s nord -t grey

echo "Installing GTK theme"

git clone https://github.com/Battlesquid/gtk.git ~/repos/fool-moon-phocus
cd ~/repos/fool-moon-phocus
make
make install

echo "Creating user directories"

xdg-user-dirs-update

echo "Cleaning up"

paru --clean

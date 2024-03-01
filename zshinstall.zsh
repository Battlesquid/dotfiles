#/usr/bin/zsh

touch ~/.aliases.zsh
touch ~/.path.zsh

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing oh-my-zsh-plugins"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing icon theme"

git clone https://github.com/vinceliuice/Tela-icon-theme.git ~/repos/tela-icon-theme
chmod +x ~/repos/tela-icon-theme/install.sh
~/repos/tela-icon-theme/install.sh nord

echo "Installing GTK theme"

git clone https://github.com/Battlesquid/gtk.git ~/repos/fool-moon-phocus
cd ~/repos/fool-moon-phocus
make
make install

echo "Creating user directories"

xdg-user-dirs-update

echo "Cleaning up"

paru --clean

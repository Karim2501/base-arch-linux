#!/bin/bash

#Make directory
#mkdir -p ~/.local/share/fonts
mkdir -p ~/.srcs
mkdir -p ~/.config

#Install paru - helper AUR
git clone https://aur.archlinux.org/paru.git ~/.srcs
cd ~/.srcs/paru/ && makepkg -si

#Update mirrorlist 
sudo reflector -c Indonesia -a 12 --sort rate --save /etc/pacman.d/mirrorlist

#Refresh pacman
sudo pacman -noconfirm -Syyu

#Install package
sudo pacman -S --noconfirm xorg-xinit xorg-xinput qtile zsh wget git feh gparted alacritty obs-studio kdenlive code inkscape gimp libreoffice shotcut python-pip
paru -S --noconfirm ttf-dejavu meslo-nerd-font-powerlevel10k moc-pulse pfetch rofi-git google-chrome
pip install psutil

#Install oh-my-zsh
cd ~/
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#oh-my-zsh from git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

#Copy Source Code
cp .config ~/
cp .xinitrc ~/
cp .zprofile ~/
cp .zshrc ~/
cp Pictures ~/ -R

#Enable if you want

echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot

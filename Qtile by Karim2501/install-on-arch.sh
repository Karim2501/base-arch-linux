#!/bin/bash

#Update mirrorlist 
sudo reflector -c Indonesia -a 12 --sort rate --save /etc/pacman.d/mirrorlist

#Refresh pacman
sudo pacman -noconfirm -Syyu

#Install package
sudo pacman -S --noconfirm xorg-xinit xorg-xinput qtile zsh wget git feh gparted alacritty obs-studio kdenlive code inkscape gimp libreoffice shotcut

#Make directory
mkdir -p ~/.local/share/fonts
mkdir -p ~/.srcs
mkdir -p ~/.config

#Install paru - helper AUR
git clone https://aur.archlinux.org/paru.git ~/.srcs
cd ~/.srcs/paru/ && makepkg -si
paru -S

#Install oh-my-zsh
cd ~/
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
paru -S ttf-dejavu meslo-nerd-font-powerlevel10k

#Copy Source Code

#Enable if you want

echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot

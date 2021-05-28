#!/bin/bash

#Update mirrorlist 
sudo reflector -c Indonesia -a 12 --sort rate --save /etc/pacman.d/mirrorlist

#Refresh pacman
sudo pacman -noconfirm -Syyu

#Install package
sudo pacman -S --noconfirm xorg xorg-xinit xorg-xinput qtile zsh wget git feh ranger gparted htop firefox alacritty obs-studio vlc kdenlive code inkscape gimp libreoffice shotcut

#Make directory
mkdir -p ~/.local/share/fonts
mkdir -p ~/.srcs
mkdir -p ~/.config

#Install paru

#Install yay

#Install oh-myzsh

#Install powerlevel10k
echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot

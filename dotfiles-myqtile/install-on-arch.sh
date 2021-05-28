#!/bin/bash

sudo reflector -c Indonesia -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -S --noconfirm xorg firefox obs-studio vlc kdenlive alacritty code inkscape gimp libreoffice shotcut qtile ranger gparted htop zsh

echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
reboot

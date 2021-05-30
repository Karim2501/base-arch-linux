#!/bin/bash

sudo reflector -c Indonesia -a 12 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -Syyu
sudo pacman -S --noconfirm sddm
sudo pacman -S --noconfirm plasma plasma-wayland-session kde-applications

sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"


sleep 5
reboot

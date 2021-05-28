#!/bin/bash
sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Indonesia -a 12 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -S --noconfirm xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies firefox simplescreenrecorder arc-gtk-theme arc-icon-theme obs-studio vlc

sudo systemctl enable lightdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot

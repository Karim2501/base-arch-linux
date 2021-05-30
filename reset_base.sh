#!/bin/bash

sudo pacman -D --asdeps $(pacman -Qqe)
sleep 10

sudo pacman -D --asexplicit base base-devel linux linux-firmware git vim nano
sleep 10

sudo su
pacman -Qttdq | pacman -Rns -
sleep 5

/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"


sleep 5
reboot

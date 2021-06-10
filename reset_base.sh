#|----------------------------------------|
#| Donation please...                     |
#| BCA Bank (Virtual) : 3901085769143295  |
#| BRI Bank (Virtual) : 88810085769143295 |
#| BNI Bank (Virtual) : 8810085769143295  |
#| Permata Bank (Virtual) : 4199134316    |
#|----------------------------------------|

#must run in superuser mode
sudo pacman -D --asdeps $(pacman -Qqe)
sleep 10

sudo pacman -D --asexplicit base linux base-devel linux-firmware git vim sudo reflector networkmanager grub bluez bluez-utils os-prober xorg pfetch python python-pip feh
sleep 10

pacman -Qttdq | pacman -Rns -
sleep 5

/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"


sleep 5
reboot

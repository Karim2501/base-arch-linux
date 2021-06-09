#|----------------------------------------|
#| Donation please...                     |
#| BCA Bank (Virtual) : 3901085769143295  |
#| BRI Bank (Virtual) : 88810085769143295 |
#| BNI Bank (Virtual) : 8810085769143295  |
#| Permata Bank (Virtual) : 4199134316    |
#|----------------------------------------|

#Mirror package manager
#sudo reflector -c Indonesia -a 12 --sort rate --save /etc/pacman.d/mirrorlist

#Update
sudo pacman -Syu

#Install
sudo pacman -S --noconfirm sddm
sudo pacman -S --noconfirm plasma plasma-wayland-session kde-applications

sudo systemctl enable sddm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"


sleep 5
reboot

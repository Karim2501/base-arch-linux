#|----------------------------------------|
#| Donation please...                  	  |
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
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies arc-gtk-theme arc-icon-theme

sudo systemctl enable lightdm 
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"


sleep 5
reboot

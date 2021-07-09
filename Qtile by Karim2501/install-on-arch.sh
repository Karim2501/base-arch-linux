#|----------------------------------------|
#| Donation please...                     |
#| BCA Bank (Virtual) : 3901085769143295  |
#| BRI Bank (Virtual) : 88810085769143295 |
#| BNI Bank (Virtual) : 8810085769143295  |
#| Permata Bank (Virtual) : 4199134316    |
#|----------------------------------------|

#Update package manager
sudo pacman -Syu --noconfirm

#Install package manager
sudo pacman -S --noconfirm --needed base-devel wget
sudo pacman -S --noconfirm --needed rofi feh xorg xorg-xinit xorg-xinput
sudo pacman -S --needed python-pip
sudo pacman -S --noconfirm qtile zsh alacritty gparted obs-studio code inkscape gimp shotcut
pip install psutil

sleep 10 && clear
#Install paru
if [ -d ~/.srcs/paru ]; then
  echo "source direktori detected, install paru now..."
  cd ~/.srcs/paru/ && makepkg -si
  paru -S --noconfirm --needed ttf-dejavu ttf-meslo-nerd-font-powerlevel10k moc-pulse pfetch google-chrome telegram-desktop ttf-font-awesome ttf-font-awesome-4 wps-office wps-office-fonts;
else
  echo "make sources direktori and install paru"
  mkdir ~/.srcs
  git clone https://aur.archlinux.org/paru.git ~/.srcs/paru
  cd ~/.srcs/paru/ && makepkg -si
  paru -S --noconfirm --needed ttf-dejavu ttf-meslo-nerd-font-powerlevel10k moc-pulse pfetch google-chrome telegram-desktop ttf-font-awesome ttf-font-awesome-4 wps-office wps-office-fonts;
fi

sleep 10 && clear
#Install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
  echo "file oh-my-zsh detected, backup..."
  rm -rf ~/.oh-my-zsh-old
  mkdir ~/.oh-my-zsh-old && mv ~/.oh-my-zsh ~/.oh-my-zsh-old
  cd ~/
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
else
  echo "file oh-my-zsh no detected"
  cd ~/
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi

#|----------------------------------------|
#| Donation please...                     |
#| BCA Bank (Virtual) : 3901085769143295  |
#| BRI Bank (Virtual) : 88810085769143295 |
#| BNI Bank (Virtual) : 8810085769143295  |
#| Permata Bank (Virtual) : 4199134316    |
#|----------------------------------------|

#Update package manager
sudo pacman -noconfirm -Syu

#Install package manager
sudo pacman -S --noconfirm --needed base-devel wget git
sudo pacman -S --noconfirm --needed rofi feh xorg xorg-xinit xorg-xinput
sudo pacman -S --needed python-pip
sudo pacman -S --noconfirm qtile zsh gparted alacritty obs-studio code inkscape gimp libreoffice shotcut
pip install psutil

#Install font external
if [ -d ~/.local/share/fonts ]; then
  echo "some font detected, backup and install used font"
  mkdir ~/.local/share/fonts_old && mv ~/.local/share/fonts ~/.local/share/fonts_old;
else
  echo "nothing detected fonts"
  mkdir ~/.local/share/fonts;
fi

#Install paru
if [ -d ~/.srcs ]; then
  echo "source direktori detected, backup and install paru"
  mkdir ~/.srcs_old && mv ~/.srcs/* ~/.srcs_old -rf
  git clone https://aur.archlinux.org/paru.git ~/.srcs/paru
  cd ~/.srcs/paru/ && makepkg -si
  paru -S --noconfirm ttf-dejavu meslo-nerd-font-powerlevel10k moc-pulse pfetch rofi-git google-chrome telegram-desktop ttf-font-awesome ttf-font-awesome-4;
else
  echo "make sources direktori and install paru"
  mkdir -p ~/.srcs
  git clone https://aur.archlinux.org/paru.git ~/.srcs/paru
  cd ~/.srcs/paru/ && makepkg -si
  paru -S --noconfirm ttf-dejavu meslo-nerd-font-powerlevel10k moc-pulse pfetch rofi-git google-chrome telegram-desktop ttf-font-awesome ttf-font-awesome-4;
fi

#Copy Config file
cd ~/base-arch-linux/Qtile\ by\ Karim2501

if [ -d ~/.config ]; then
  echo "config direktori detected, backup..."
  mkdir ~/.config_old && mv ~/.config/* ~/.config_old -rf
  cp Config/* ~/.config;
else
  echo "config no detected, install qtile config"
  mkdir ~/.config && cp Config/* ~/.config;
fi

#Copy Source Code
if [ -d ~/.xinitrc]; then
  echo "xinitrc detected, backup..."
  mv ~/.xinitrc ~/.xinitrc_old
  cp Script/xinitrc ~/ && mv ~/xinitrc ~/.xinitrc;
else
  echo "xinitrc not detected, install..."
  cp Script/xinitrc ~/ && mv ~/xinitrc ~/.xinitrc;
fi

if [ -d ~/.zshrc]; then
  echo "zshrc detected, backup..."
  mv ~/.zshrc ~/.zshrc_old
  cp Script/zshrc ~/ && mv ~/zshrc ~/.zshrc;
else
  echo "zshrc not detected, install..."
  cp Script/zshrc ~/ && mv ~/zshrc ~/.zshrc;
fi

if [ -d ~/.zprofile]; then
  echo "zprofile detected, backup..."
  mv ~/.zprofile ~/.zprofile_old
  cp Script/zprofile ~/ && mv ~/zprofile ~/.zprofile;
else
  echo "zprofile not detected, install..."
  cp Script/zprofile ~/ && mv ~/zprofile ~/.zprofile;
fi
if [ -d ~/.vimrc]; then
  echo "vimrc detected, backup..."
  mv ~/.vimrc ~/.vimrc_old
  cp Script/vimrc ~/ && mv ~/vimrc ~/.vimrc;
else
  echo "vimrc not detected, install..."
  cp Script/vimrc ~/ && mv ~/vimrc ~/.vimrc;
fi

cp Pictures/* ~/ -rf

#Install oh-my-zsh
cd ~/
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

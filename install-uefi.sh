#|----------------------------------------|
#| Donation please...                     |
#| BCA Bank (Virtual) : 3901085769143295  |
#| BRI Bank (Virtual) : 88810085769143295 |
#| BNI Bank (Virtual) : 8810085769143295  |
#| Permata Bank (Virtual) : 4199134316    |
#|----------------------------------------|

#Update
pacman -Syu --noconfirm

#Update Time
ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
hwclock --systohc

#Update language
rm -rf /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen
rm -rf /etc/locale.conf
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

#Update Keyboard
rm -rf /etc/vconsole.conf
echo "KEYMAP=us" >> /etc/vconsole.conf

#Update Hostname
rm -rf /etc/hostname
echo "Arch" >> /etc/hostname
rm -rf /etc/hosts
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 Arch.localdomain Arch" >> /etc/hosts

#Update root password
echo root:password | chpasswd

#Install
pacman -S --noconfirm efibootmgr grub networkmanager network-manager-applet wpa_supplicant base-devel linux-headers dnsutils bluez bluez-utils cups alsa alsa-utils pulseaudio openssh reflector acpi acpid acpi_call qemu qemu-arch-extra net-tools dhcpcd os-prober ntfs-3g terminus-font xorg ranger htop firefox filezilla neovim vlc wget

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

#Update grub
grub-install /dev/sdb --efi-directory=/boot --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg

#System enable
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable reflector.service
systemctl enable reflector.timer
systemctl enable acpid

#Add user
useradd -mG wheel karim
echo karim:password | chpasswd
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers.d/karim

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"


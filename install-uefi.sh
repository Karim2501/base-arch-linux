#!/bin/bash

pacman -Syy --noconfirm
ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
hwclock --systohc
rm -rf /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen
rm -rf /etc/locale.conf
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
rm -rf /etc/vconsole.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
rm -rf /hostname
echo "Arch" >> /etc/hostname
rm -rf /etc/hosts
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 Arch.localdomain Arch" >> /etc/hosts
echo root:password | chpasswd

pacman -S --noconfirm grub efibootmgr networkmanager network-manager-applet wpa_supplicant base-devel linux-headers dnsutils bluez bluez-utils cups alsa alsa-utils pulseaudio openssh reflector acpi acpid acpi_call qemu qemu-arch-extra net-tools dhcpcd os-prober ntfs-3g terminus-font xorg ranger htop neofetch firefox filezilla vim nano vlc

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install /dev/sdb --efi-directory=/boot --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable reflector.timer
systemctl enable acpid

useradd -mG wheel karim
echo karim:password | chpasswd
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers.d/karim

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"

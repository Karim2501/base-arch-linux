# Arch Basic Install Commands-Script

- In this repository you will find packages-scripts for the base install of Arch Linux and the Gnome, KDE, Cinnamon and Xfce desktop environments. More to c
ome for Windows Managers soon.
- Modify the packages to your liking, make the script executable with `chmod +x kde.sh` and then run with `./kde.sh`.
- Remember that the first part of the Arch Linux install is manual. The Arch Linux Wiki: https://wiki.archlinux.org/title/Installation_guide.
- Install the base packages and make sure to inlcude git so that you can clone the repository in arch-chroot.

# Installation Arch Linux
1. If needed, load your keymap
2. Connect to internet with `dhcpcd` or `iwctl`
3. Check internet with `ping google.com`
4. Sync time `timedatectl set-ntp true`
5. Check partition with `fdisk -l` or `lsblk`
6. Partition the disk with `parted` or `cfdisk`
7. Formating for ext4 `mkfs.ext4 /dev/sdx2`
8. Formating for boot(EFI) `mkfs.fat -F32 /dev/sdx1`
9. Mount ext4 to /mnt `mount /dev/sdx2 /mnt`
10. Make directori for EFI `mkdir /mnt/boot`
11. Mount boot(EFI) to /mnt/boot`mount /dev/sdx1 /mnt/boot`
12. Install the base packages into /mnt by `pacstrap /mnt base linux linux-firmware git vim nano`
13. Generate the fstab file with `genfstab -U /mnt >> /mnt/etc/fstab`
14. . Chroot in with `arch-chroot /mnt`
15. Download the git repository with `git clone https://github.com/Karim2501/base-arch-linux`
16. `cd base-arch-linux`
17. Make script to executeable with `chmod +x install-uefi.sh` or `chmod +x install-mbr.sh`
18. Run with `./install-uefi.sh` or `./install-mbr.sh`
19. Enjoy:)

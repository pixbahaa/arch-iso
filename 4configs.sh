#!/bin/bash

pacman -S grub doas vim networkmanager --noconfirm

sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "KEYMAP=us" > /etc/vconsole.conf

ln -sf /usr/share/zoneinfo/Africa/Algiers /etc/localtime
hwclock --systohc

echo "Arch" > /etc/hostname

grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg

echo "root:r" | chpasswd

useradd -m -G wheel,video,audio -s /bin/bash bahaa

echo "bahaa:b" | chpasswd

systemctl enable NetworkManager

echo "permit nopass bahaa as root" > /etc/doas.conf
#!/bin/bash

# Checking sudo
if [[ $EUID -ne 0 ]]; then
   echo "Execute with sudo" 
   exit 1
fi

echo "Flatpak and snap will be installed too"

sudo pacman -Sy --needed --noconfirm flatpak snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

echo "Some softwares will be installed"

sudo pacman -Sy --needed --noconfirm rofi wofi wlogout kitty waybar nautilus startship

echo "Brave and KWaller (for keys and passwords)"

sudo pacman -Sy --needed --noconfirm gnome-keyring
sudo snap install brave

mv configs/ ~/.config/


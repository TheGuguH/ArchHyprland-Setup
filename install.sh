#!/bin/bash

# Check for sudo
if [[ $EUID -ne 0 ]]; then
   echo "Please run as root (sudo)" 
   exit 1
fi

echo "Updating the system..."
sudo pacman -Syu --noconfirm || { echo "Error updating the system"; exit 1; }

echo "Installing programming packages..."
bash ./apps/programming/setup_programming.sh || { echo "Error on installing programming packages"; exit 1; }

echo "Installing yay..."
sudo pacman -S --needed git base-devel --noconfirm || { echo "Error installing git and base-devel"; exit 1; }
git clone https://aur.archlinux.org/yay.git || { echo "Error cloning yay repository"; exit 1; }
cd yay && makepkg -si --noconfirm || { echo "Error installing yay"; exit 1; }
cd ..

echo "Setting up Hyprland..."
bash ./hyprland/setup_hyprland.sh || { echo "Error on setting up Hyprland"; exit 1; }

echo "Installing utilities..."
bash ./apps/utilities/setup_utility.sh || { echo "Error on installing utilities"; exit 1; }

echo "Installing general apps..."
bash ./apps/general-use/setup_general.sh || { echo "Error on installing general apps"; exit 1; }

echo "Intalling theme for Arch Linux, GRUB, login screen and icons"

bash ./themes/Elegant-mojave-blur-grub-themes/left-dark-4k/install.sh || { echo "Error on installing GRUB theme"; exit 1; }

cp -r ./themes/cursor/ ~/.icons/

gsettings set org.gnome.desktop.interface cursor-theme "Future-black Cursors"
gsettings set org.gnome.desktop.interface cursor-size 24

sudo cp -r ./themes/Custom-Sugar-Candy/ /usr/share/sddm/themes/Custom-Sugar-Candy/
echo -e "[Theme]\nCurrent=Custom-Sugar-Candy" | sudo tee /etc/sddm.conf > /dev/null || { echo "Error configuring SDDM theme"; exit 1; }

echo "All done! Use 'sudo reboot' to restart the system"


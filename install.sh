#!/bin/bash

echo "Updating the system..."
sudo pacman -Syu --noconfirm || { echo "Error updating the system"; exit 1; }

echo "Installing programming packages..."
bash ./apps/programming/setup_programming.sh || { echo "Error on installing programming packages"; exit 1; }

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git || { echo "Error cloning yay repository"; exit 1; }
cd yay && makepkg -si || { echo "Error installing yay"; exit 1; }
cd ..

echo "Setting up Hyprland..."
bash ./hyprland/setup_hyprland.sh || { echo "Error on setting up Hyprland"; exit 1; }

echo "Installing utilities..."
bash ./apps/utilities/setup_utility.sh || { echo "Error on installing utilities"; exit 1; }

echo "Installing general apps..."
bash ./apps/general-use/setup_general.sh || { echo "Error on installing general apps"; exit 1; }

echo "Intalling theme for Arch Linux, GRUB, login screen and icons"

sudo pacman -Sy --needed --noconfirm ttf-jetbrains-mono-nerd \
    xorg-font-util \
    xorg-fonts-misc \
    xorg-xinit
    
yay -Sy update-grub

cd ./themes/Elegant-mojave-blur-grub-themes/left-dark-1080p
sudo ./install.sh || { echo "Error on installing GRUB theme"; exit 1; }
cd ../../../

cp -r user/ ~/
cp -r ./themes/cursor/ ~/.icons/

gsettings set org.gnome.desktop.interface cursor-theme "Future-black Cursors"
gsettings set org.gnome.desktop.interface cursor-size 24

sudo cp -r ./themes/Custom-Sugar-Candy/ /usr/share/sddm/themes/
echo -e "[Theme]\nCurrent=Custom-Sugar-Candy" | sudo tee /etc/sddm.conf > /dev/null || { echo "Error configuring SDDM theme"; exit 1; }

sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "All done! Use 'sudo reboot' to restart the system"


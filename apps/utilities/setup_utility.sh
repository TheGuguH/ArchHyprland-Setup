#!/bin/bash

echo "Flatpak and snap will be installed too"

sudo pacman -Sy --needed --noconfirm flatpak
yay -Sy snapd
sudo systemctl enable --now snapd.socket

echo "Some softwares will be installed"

yay -Sy wlogout
yay -Sy starship
sudo pacman -Sy --needed --noconfirm rofi wofi kitty waybar nautilus swaync

# Add Starship initialization to .bashrc
if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

echo "Brave and KWaller (for keys and passwords)"

sudo pacman -Sy --needed --noconfirm gnome-keyring
sudo snap install brave

echo "JetBrain Nerd font"

cp -r ./apps/utilities/configs/* ~/.config/


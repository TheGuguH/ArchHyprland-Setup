#!/bin/bash

# Checking sudo
if [[ $EUID -ne 0 ]]; then
   echo "Execute with sudo." 
   exit 1
fi

sudo pacman -Sy --needed --noconfirm hyprlock hyprpaper hypridle hyprshot || { echo "Error installing Hyprland packages."; exit 1; }

mkdir -p ~/.config/hypr/
mv config/ ~/.config/hypr/ || { echo "Error moving Hyprland config files."; exit 1; }

echo "Hyprland config files done"


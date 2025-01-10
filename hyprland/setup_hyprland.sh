#!/bin/bash

yay -Sy hyprshot
sudo pacman -Sy --needed --noconfirm hyprlock hyprpaper hypridle || { echo "Error installing Hyprland packages."; exit 1; }

mkdir -p ~/.config/hypr/
cp -r ./hyprland/config/* ~/.config/ || { echo "Error moving Hyprland config files."; exit 1; }

echo "Hyprland config files done"


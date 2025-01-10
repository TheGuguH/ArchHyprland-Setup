#!/bin/bash

# Checking sudo
if [[ $EUID -ne 0 ]]; then
   echo "Execute with sudo." 
   exit 1
fi

sudo pacman -Sy --needed --noconfirm gnome-eye \
    dconf-editor \
    gnome-text-editor \
    totem \
    strawberry \
    foliate \
    gnome-calculator \
    lshw \
    btop


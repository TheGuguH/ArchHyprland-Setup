#!/bin/bash

echo "Git, base-devel, debugging and profiling tools"
sudo pacman -Sy --needed --noconfirm git base-devel gdb lldb valgrind perf cppcheck

echo "Installing Neovim with NvChad (with some changes)"
sudo pacman -Sy --needed --noconfirm neovim

# This folder contains NvChad (with some changes)
cp -r ./apps/programming/configs/* ~/.config/

echo "Installing apps for C, C++, Assembly, Rust and Java development"
sudo pacman -Sy --needed --noconfirm gcc \
    clang \
    nasm \
    rust \
    rust-analyzer \
    cargo \
    jdk8-openjdk jre8-openjdk \
    jdk11-openjdk jre11-openjdk \
    jdk17-openjdk jre17-openjdk \
    intellij-idea-community-edition

echo "All installed!"


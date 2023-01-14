#! /bin/sh

# Add base devel packages
sudo pacman -S --needed --noconfirm base-devel

# Cloning Paru
git clone https://aur.archlinux.org/paru.git /tmp/paru

# Building Paru
cd /tmp/paru
makepkg -si

# Run paru to install missign dependencies
paru

# install packages
paru -Sy --noconfirm \
gitflow-avh \
lazydocker \
stylepak-git \
ttf-ms-fonts \
visual-studio-code-bin

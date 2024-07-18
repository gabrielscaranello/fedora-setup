#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/flatpak-packages" | tr '\n' ' ')

echo "Installing Flatpak packages..."

echo "Installing..."
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y --system flathub $PACKAGES

sudo flatpak override --system --filesystem=xdg-config/gtk-3.0:ro
sudo flatpak override --system --filesystem=xdg-config/gtk-4.0:ro

echo "Flatpak packages installed..."

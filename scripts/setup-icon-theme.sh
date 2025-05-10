#! /bin/bash

echo "Setting up Icon Theme..."

echo "Defining Icon Theme..."
papirus-folders -C adwaita
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

echo "Icon Theme setup done."

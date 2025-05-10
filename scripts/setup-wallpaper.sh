#! /bin/bash

PWD=$(pwd)

echo "Setting up Wallpaper..."

echo "Copying wallpaper..."
sudo mkdir -p /usr/share/backgrounds/user
sudo cp "$PWD"/assets/wallpaper.png /usr/share/backgrounds/user/default.png

echo "Setting wallpaper..."
gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/user/default.png"
gsettings set org.gnome.desktop.background picture-uri-dark "file:///usr/share/backgrounds/user/default.png"
gsettings set org.gnome.desktop.screensaver picture-uri "file:///usr/share/backgrounds/user/default.png"

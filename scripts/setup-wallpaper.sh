#! /bin/bash

PWD=$(pwd)
TARGET="/usr/share/backgrounds/user"
FINAL_FILE="$TARGET/user-default.jpg"

echo "Setting up Wallpaper..."

echo "Copying wallpaper..."
sudo mkdir -p "$TARGET"
sudo cp "${PWD}/assets/wallpaper.jpg" "$FINAL_FILE"

gsettings set org.gnome.desktop.background picture-uri "file://${FINAL_FILE}"
gsettings set org.gnome.desktop.background picture-uri-dark "file://${FINAL_FILE}"
gsettings set org.gnome.desktop.screensaver picture-uri "file://${FINAL_FILE}"

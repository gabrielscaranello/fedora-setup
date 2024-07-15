#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/system-packages" | tr '\n' ' ')

echo "Installing native packages..."
sudo zypper dist-upgrade -y
sudo zypper install -y $PACKAGES
echo "native packages installed."

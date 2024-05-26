#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/system-packages" | tr '\n' ' ')

echo "Installing native packages..."
sudo dnf upgrade -y --refresh
sudo dnf install -y $PACKAGES
echo "native packages installed."

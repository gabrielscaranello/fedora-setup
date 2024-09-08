#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/system-packages" | tr '\n' ' ')
EXCLUDE=$(cat "$PWD/system-excluded-packages" | tr '\n' ' ')

echo "Installing native packages..."
sudo dnf upgrade -y --refresh
sudo dnf install -y $PACKAGES --exclude $EXCLUDE
echo "native packages installed."

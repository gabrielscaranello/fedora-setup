#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/system-packages")

echo "Installing native packages..."
sudo dnf upgrade -y --refresh
echo "$PACKAGES" | xargs sudo dnf install -y
echo "native packages installed."

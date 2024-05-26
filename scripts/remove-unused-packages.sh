#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/unused-packages" | tr '\n' ' ')

echo "Removing unused packages..."
sudo dnf remove -y $PACKAGES
sudo dnf autoremove -y
echo "Unused packages removed."

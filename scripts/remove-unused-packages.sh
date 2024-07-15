#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/unused-packages" | tr '\n' ' ')

echo "Removing unused packages..."
sudo zypper remove -y $PACKAGES
echo "Unused packages removed."

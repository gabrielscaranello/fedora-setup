#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/unused-packages")

echo "Removing unused packages..."
echo "$PACKAGES" | xargs sudo dnf remove -y
sudo dnf autoremove -y
echo "Unused packages removed."

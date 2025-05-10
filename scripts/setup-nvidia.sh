#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"$PWD/nvidia-packages")

echo "Configuring NVIDIA drivers..."

echo "Installing driver packages"
echo "$PACKAGES" | xargs sudo dnf install -y

echo "Enabling nvidia driver..."
sudo akmods --force
sudo dracut --force

echo "NVIDIA drivers configured."

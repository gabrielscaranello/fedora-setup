#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/nvidia-packages" | tr '\n' ' ')

echo "Configuring NVIDIA hybrid drivers..."

echo "Enabling additional repos..."
sudo dnf copr enable sunwire/envycontrol -y

echo "Installing driver packages"
sudo dnf install -y $PACKAGES

echo "Enabling nvidia driver..."
sudo akmods --force
sudo dracut --force

echo "Change to nvidia driver usign envycontrol..."
sudo envycontrol --dm gdm --force-comp -s nvidia

echo "NVIDIA hybrid drivers configured."

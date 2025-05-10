#! /bin/bash

PWD=$(pwd)
REGULAR_PACKAGES=$(tr '\n' ' ' <"$PWD/nvidia-packages")
HYBRID_PACKAGES=$(tr '\n' ' ' <"$PWD/nvidia-hybrid-packages")
PACKAGES="$REGULAR_PACKAGES $HYBRID_PACKAGES"

echo "Configuring NVIDIA hybrid drivers..."

echo "Enabling additional repos..."
sudo dnf copr enable sunwire/envycontrol -y

echo "Installing driver packages"
echo "$PACKAGES" | xargs sudo dnf install -y

echo "Enabling nvidia driver..."
sudo akmods --force
sudo dracut --force

echo "Change to nvidia driver usign envycontrol..."
sudo envycontrol --dm gdm --force-comp -s nvidia

echo "NVIDIA hybrid drivers configured."

#! /bin/bash

PWD=$(pwd)
PACKAGES=$(cat "$PWD/nvidia-packages" | tr '\n' ' ')

echo "Configuring NVIDIA hybrid drivers..."

echo "Enabling additional repos..."
sudo zypper ar -ef https://download.nvidia.com/opensuse/tumbleweed NVIDIA

echo "Installing driver packages"
sudo zypper install $PACKAGES

echo "Enabling nvidia driver..."
sudo prime-select boot nvidia

echo "NVIDIA hybrid drivers configured."

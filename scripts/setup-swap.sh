#! /bin/bash

SIZE=$(cat </proc/meminfo | awk '/MemTotal/ { printf("%.0f", ($2 / 1024 / 1024 / 2)) }')

echo "Setting up swap..."

echo "Removing existing swap..."
sudo swapoff --all
sudo rm -rf /swapfile
sudo rm -rf /etc/sysctl.d/00-custom.conf
sudo sed -i '/^zram-size/d' /etc/systemd/zram-generator.conf
sudo sed -i '/^\/swapfile/d' /etc/fstab

echo "Configuring zram-generator..."
echo 'zram-size=max(ram/2, 4096)' | sudo tee -a /etc/systemd/zram-generator.conf

echo "Creating swapfile"
sudo fallocate -l ${SIZE}G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

echo "Configuring swappiness and vfs_cache_pressure..."
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.d/00-custom.conf
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.d/00-custom.conf

echo "Starting zramswap..."
sudo swapon /swapfile

echo "Swap configured."

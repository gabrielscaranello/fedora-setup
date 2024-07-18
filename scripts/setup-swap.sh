#! /bin/bash

echo "Setting up swap..."

echo "Removing existing swap..."
sudo rm -rf /etc/sysctl.d/00-custom.conf

echo "Configuring swappiness and vfs_cache_pressure..."
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.d/00-custom.conf >/dev/null
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.d/00-custom.conf >/dev/null

echo "Swap configured."

#! /bin/bash

SIZE=$(cat </proc/meminfo | awk '/MemTotal/ { printf("%.0f", ($2 / 1024 / 1024 / 2)) }')
MB_SIZE=$(echo "$SIZE" | awk '{ printf "%.0f", ($1 * 1024) }')

echo "Setting up swap..."

echo "Removing existing swap..."
sudo swapoff --all
sudo rm -rf /swapfile
sudo rm -rf /etc/sysctl.d/00-custom.conf
sudo sed -i '/zram0/d; /^zram-size/d; /^compression-algorithm/d' /etc/systemd/zram-generator.conf
sudo sed -i '/^\/swapfile/d' /etc/fstab >/dev/null

echo "Configuring zram-generator..."
sudo tee /etc/systemd/zram-generator.conf >/dev/null <<EOL
[zram0]
zram-size = max(ram/2, $MB_SIZE)
compression-algorithm = lz4
EOL

echo "Creating swapfile"
sudo btrfs filesystem mkswapfile --size "${SIZE}G" /swapfile
sudo btrfs inspect-internal map-swapfile /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab >/dev/null

echo "Configuring swappiness and vfs_cache_pressure..."
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.d/00-custom.conf >/dev/null
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.d/00-custom.conf >/dev/null

echo "Starting zramswap..."
sudo swapon /swapfile
sudo systemctl daemon-reload
sudo systemctl start systemd-zram-setup@zram0 >/dev/null

echo "Swap configured."

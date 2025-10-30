#! /bin/bash

PWD=$(pwd)
CONFIG_FILE="$PWD/config/timeshift.json"
TARGET_FILE="/etc/timeshift/timeshift.json"

echo "Copying timeshift config..."

echo "Removing old files if exists..."
sudo rm -rf $TARGET_FILE

echo "Creating timeshift config..."
sudo cp "$CONFIG_FILE" "$TARGET_FILE"

echo "Installing grub-btrfsd"
rm -rf /tmp/grub-btrfs
git clone --depth=1 https://github.com/Antynea/grub-btrfs.git /tmp/grub-btrfs
sed -i 's|^#GRUB_BTRFS_MKCONFIG=/usr/bin/grub2-mkconfig|GRUB_BTRFS_MKCONFIG=/sbin/grub2-mkconfig|' /tmp/grub-btrfs/config
sed -i 's|^#GRUB_BTRFS_GRUB_DIRNAME="/boot/grub2"|GRUB_BTRFS_GRUB_DIRNAME="/boot/grub2"|' /tmp/grub-btrfs/config
sed -i 's|^#GRUB_BTRFS_SCRIPT_CHECK=grub2-script-check|GRUB_BTRFS_SCRIPT_CHECK=grub2-script-check|' /tmp/grub-btrfs/config
bash -c "cd /tmp/grub-btrfs && sudo make install"
sudo systemctl daemon-reload

echo "Fixing grub-btrfsd"
GRUB_BTRFSD_CONFIG=$(systemctl show -p FragmentPath grub-btrfsd.service | cut -d= -f2)
if [[ -f "$GRUB_BTRFSD_CONFIG" ]]; then
  sudo sed -i 's|^ExecStart=/usr/bin/grub-btrfsd --syslog /.snapshots|ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto|' "$GRUB_BTRFSD_CONFIG"
  sudo systemctl stop grub-btrfsd.service
  sudo systemctl enable --now grub-btrfsd.service
  sudo systemctl daemon-reload
  echo "btrfsd service fixed."
else
  echo "btrfsd service not found. Please fix manually."
fi


echo "Timeshift config setup done."

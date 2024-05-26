#! /bin/bash

echo "Syncing time..."
sudo timedatectl set-local-rtc 0
sudo hwclock --systohc
echo "Time synced."

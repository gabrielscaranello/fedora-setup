#! /bin/bash

echo "Enabling services..."

sudo systemctl enable docker
sudo systemctl enable ufw

echo "Services enabled."

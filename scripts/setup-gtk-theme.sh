#! /bin/bash

echo "Setting up GTK Theme..."

echo "Installing GTK Theme..."
sudo dnf install -y adw-gtk3-theme

echo "Installing GTK Theme for flatpak..."
flatpak install flathub -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark

echo "Defining GTK Theme..."
gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
gsettings set org.gnome.desktop.wm.preferences theme "adw-gtk3-dark"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "GTK Theme setup done."

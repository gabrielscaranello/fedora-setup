#! /bin/bash

echo "Setting up GTK Theme..."

echo "Removing old files if exists..."
sudo rm -rf /usr/share/themes/catppuccin-* /tmp/gtk-theme ~/.config/gtk-4.0

echo "Cloning GTK Theme..."
git clone --recurse-submodules https://github.com/catppuccin/gtk.git /tmp/gtk-theme

echo "Installing GTK Theme..."
bash -c "cd /tmp/gtk-theme && virtualenv -p python3 venv && source venv/bin/activate && pip install -r requirements.txt && python build.py mocha -d ./build -a blue -s standard --tweaks rimless"
sudo mv /tmp/gtk-theme/build/* /usr/share/themes

echo "Linking GTK-4.0 Theme..."
mkdir -p ~/.config/gtk-4.0
ln -fs /usr/share/themes/catppuccin-mocha-blue-standard+rimless/gtk-4.0/assets ~/.config/gtk-4.0/assets
ln -fs /usr/share/themes/catppuccin-mocha-blue-standard+rimless/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
ln -fs /usr/share/themes/catppuccin-mocha-blue-standard+rimless/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css

echo "Defining GTK Theme..."
gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-blue-standard+rimless"
gsettings set org.gnome.desktop.wm.preferences theme "catppuccin-mocha-blue-standard+rimless"
dconf write /org/gnome/shell/extensions/user-theme/name "'catppuccin-mocha-blue-standard+rimless'"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "GTK Theme setup done."

#!/bin/bash

set -e # Stop script if there's an error

echo "Welcome to Rei's dotfiles installer!"

# Check if paru is installed
if ! command -v paru &>/dev/null; then
  echo "Error: paru is not installed. Please install paru first."
  exit 1
fi

# Function for installation
install_packages() {
  echo "Installing: $1"
  paru -S --noconfirm --needed "${@:2}"
  echo "Done installing: $1"
  echo "-----------------------------------"
}

echo "1. Installing Starter Packages..."
install_packages "Starter Packages" i3-wm vim ranger kitty imagemagick sddm xorg firefox rofi polybar dunst brightnessctl pavucontrol pulseaudio picom feh cava fuse fastfetch cheese zathura zathura-pdf-poppler papirus-folders-catppuccin-git nwg-look

echo "2. Installing Fonts..."
install_packages "Fonts" noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-maple-beta

echo "3. Installing Thunar File Manager Packages..."
install_packages "Thunar Packages" thunar thunar-volman tumbler ffmpegthumbnailer file-roller thunar-archive-plugin gvfs gvfs-mtp android-tools android-udev mousepad p7zip unrar unzip

echo "4. Installing SDDM Dependencies..."
install_packages "SDDM Dependencies" qt6-svg qt6-declarative qt5-quickcontrols2

echo "5. Installing Screenshot Dependencies..."
install_packages "Screenshot Dependencies" maim xclip viewnior

echo "6. Installing MPD and NCMPCPP..."
install_packages "MPD and NCMPCPP" mpd ncmpcpp

echo "Installation process completed successfully!"

echo "7. Enabling and Starting SDDM..."
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run this script as root to enable and start SDDM."
  exit 1
fi

systemctl enable sddm
systemctl start sddm

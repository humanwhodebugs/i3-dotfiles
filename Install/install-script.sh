#!/bin/bash

set -eu # Stop script if there's an error

echo "Welcome to Rei's dotfiles installer!"

# Function for installation
install_packages() {
  echo "Installing: $1"
  paru -S --noconfirm --needed "${@:2}"
  echo "Done installing: $1"
  echo "-----------------------------------"
}

echo "1. Installing Starter Packages..."
install_packages "Starter Packages" i3-wm vim ranger kitty imagemagick sddm xorg firefox rofi polybar dunst brightnessctl pavucontrol pulseaudio picom feh cava fuse fastfetch cheese zathura zathura-pdf-poppler papirus-folders-catppuccin-git nwg-look zsh

echo "2. Installing Fonts..."
install_packages "Fonts" noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-jetbrains-mono ttf-jetbrains-mono-nerd maplemono-ttf maplemono-nf-unhinted maplemono-nf-cn-unhinted

echo "3. Installing Thunar File Manager Packages..."
install_packages "Thunar Packages" thunar thunar-volman tumbler ffmpegthumbnailer file-roller thunar-archive-plugin gvfs gvfs-mtp android-tools android-udev mousepad p7zip unrar unzip

echo "4. Installing SDDM Dependencies..."
install_packages "SDDM Dependencies" qt6-svg qt6-declarative qt5-quickcontrols2

echo "5. Installing Screenshot and Screenrecord Dependencies..."
install_packages "Screenshot Dependencies" maim xclip viewnior gpu-screen-recorder

echo "6. Installing MPD and NCMPCPP..."
install_packages "MPD and NCMPCPP" mpd ncmpcpp mpc mpv-mpris

echo "Installation process completed successfully!"

echo "Enabling and starting SDDM..."
sudo systemctl enable sddm
sudo systemctl start sddm

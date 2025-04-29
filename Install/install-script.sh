#!/bin/bash

set -eu # Stop script if there's an error

echo "╭───────────────────────────╮"
echo "│       Rei Dotfiles        │"
echo "│   Powered by Arch Linux   │"
echo "╰───────────────────────────╯"

echo "╭───────────────────────────╮"
echo "│ Welcome to Install Script │"
echo "╰───────────────────────────╯"

# Function for installation
install_packages() {
  echo "Installing: $1"
  paru -S --noconfirm --needed "${@:2}"
  echo "Done installing: $1"
}

echo "╭─────────────────────────────╮"
echo "│ Installing Starter Packages │"
echo "╰─────────────────────────────╯"
install_packages "Starter Packages" i3-wm vim ranger kitty imagemagick sddm xorg firefox rofi polybar dunst brightnessctl pavucontrol pulseaudio picom feh cava fuse fastfetch cheese zathura zathura-pdf-poppler papirus-folders-catppuccin-git nwg-look zsh

echo "╭──────────────────╮"
echo "│ Installing Fonts │"
echo "╰──────────────────╯"
install_packages "Fonts" noto-fonts-emoji noto-fonts-cjk noto-fonts-extra ttf-jetbrains-mono ttf-jetbrains-mono-nerd

echo "╭─────────────────────────╮"
echo "│ Installing File Manager │"
echo "╰─────────────────────────╯"
install_packages "Thunar Packages" thunar thunar-volman tumbler ffmpegthumbnailer file-roller thunar-archive-plugin gvfs gvfs-mtp android-tools android-udev mousepad p7zip unrar unzip

echo "╭──────────────────────────────╮"
echo "│ Installing SDDM Dependencies │"
echo "╰──────────────────────────────╯"
install_packages "SDDM Dependencies" qt6-svg qt6-declarative qt5-quickcontrols2

echo "╭────────────────────────────────────────╮"
echo "│ Installing Screenshot and Screenrecord │"
echo "╰────────────────────────────────────────╯"
install_packages "Screenshot Dependencies" maim xclip viewnior gpu-screen-recorder

echo "╭────────────────────────────╮"
echo "│ Installing MPD and NCMPCPP │"
echo "╰────────────────────────────╯"
install_packages "MPD and NCMPCPP" mpd ncmpcpp mpc mpv-mpris fum-bin

echo "╭──────────────────────────────────────────────╮"
echo "│ Installation Process Completed Successfully! │"
echo "╰──────────────────────────────────────────────╯"

echo "╭────────────────────────────╮"
echo "│ Enabling and Starting SDDM │"
echo "╰────────────────────────────╯"

sudo systemctl enable sddm
sudo systemctl start sddm

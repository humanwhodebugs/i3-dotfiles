#!/bin/bash

set -eu # Stop script if there's an error

# Function for installation
install_packages() {
  echo "Installing: $1"
  paru -S -noconfirm --needed "${@:2}"
  echo "Done installing: $1"
  echo "-----------------------------------"
}

# Function for installing dependencies
install_dependencies() {
  echo "Installing Dependencies for: $1"
  paru -S --noconfirm --needed --asdeps "${@:2}"
  echo "Done installing Dependencies for: $1"
  echo "-----------------------------------"
}

echo "1. Installing Development Tools..."
install_packages "Development Tools" neovim lazygit httpie tmux

echo "2. Installing Gaming Tools..."
install_packages "Gaming Tools (Main)" lutris lib32-mangohud mangohud

echo "3. Installing Gaming Tools (Dependencies)..."
install_dependencies "Gaming Tools (Dependencies)" giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2-compat lib32-sdl2-compat

echo "All packages and dependencies installed successfully!"

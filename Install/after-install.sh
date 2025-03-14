#!/bin/bash

set -eu # Stop script if there's an error

# Function for installing packages
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

# Function to clone a git repository if it doesn't exist
clone_repo() {
  local name=$1
  local repo_url=$2
  local dest_dir=$3
  local branch=${4:-} # Optional branch

  if [ ! -d "$dest_dir" ]; then
    echo "Cloning $name..."
    if [ -n "$branch" ]; then
      git clone --depth 1 --branch "$branch" "$repo_url" "$dest_dir"
    else
      git clone --depth 1 "$repo_url" "$dest_dir"
    fi
    echo "Done cloning $name into $dest_dir"
  else
    echo "$name already cloned in $dest_dir"
  fi
  echo "-----------------------------------"
}

echo "1. Installing Development Tools..."
install_packages "Development Tools" neovim lazygit httpie tmux

echo "2. Installing Gaming Tools..."
install_packages "Gaming Tools (Main)" lutris lib32-mangohud mangohud

echo "3. Installing Gaming Tools (Dependencies)..."
install_dependencies "Gaming Tools (Dependencies)" giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2-compat lib32-sdl2-compat

echo "4. Cloning TPM (Tmux Plugin Manager)..."
clone_repo "TPM" "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"

echo "5. Cloning Catppuccin Theme for Tmux (v2.1.2)..."
clone_repo "Catppuccin Tmux Theme" "https://github.com/catppuccin/tmux.git" "$HOME/.tmux/plugins/catppuccin" "v2.1.2"

echo "All packages, dependencies, and plugins installed successfully!"

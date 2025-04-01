#!/bin/bash

set -eu # Stop script if there's an error

# Function for installing packages
install_packages() {
  echo "Installing: $1"
  paru -S -noconfirm --needed "${@:2}"
  echo "Done installing: $1"
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

echo "2. Cloning TPM (Tmux Plugin Manager)..."
clone_repo "TPM" "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"

echo "3. Cloning Catppuccin Theme for Tmux (v2.1.2)..."
clone_repo "Catppuccin Tmux Theme" "https://github.com/catppuccin/tmux.git" "$HOME/.tmux/plugins/catppuccin" "v2.1.2"

echo "All packages, dependencies, and plugins installed successfully!"

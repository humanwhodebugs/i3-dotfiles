#!/bin/bash

set -eu # Stop script if there's an error

echo "╭───────────────────────────╮"
echo "│       Rei Dotfiles        │"
echo "│   Powered by Arch Linux   │"
echo "╰───────────────────────────╯"

echo "╭─────────────────────────────────╮"
echo "│ Welcome to After Install Script │"
echo "╰─────────────────────────────────╯"

# Function for installing packages
install_packages() {
  echo "Installing: $1"
  paru -S --noconfirm --needed "${@:2}"
  echo "Done installing: $1"
}

# Function for installing dependencies
install_dependencies() {
  echo "Installing: $1"
  paru -S --noconfirm --needed --asdeps "${@:2}"
  echo "Done installing: $1"
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
}

echo "╭──────────────────────────────╮"
echo "│ Installing Development Tools │"
echo "╰──────────────────────────────╯"
install_packages "Development Tools" neovim lazygit httpie tmux zsh-theme-powerlevel10k-git

echo "╭─────────────╮"
echo "│ Cloning TPM │"
echo "╰─────────────╯"
clone_repo "TPM" "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"

echo "╭────────────────────────────────╮"
echo "│ Cloning ranger_devicons Plugin │"
echo "╰────────────────────────────────╯"
clone_repo "ranger_devicons" "https://github.com/alexanderjeurissen/ranger_devicons" "$HOME/.config/ranger/plugins/ranger_devicons"

# Add 'default_linemode devicons' to rc.conf if not already present
RANGER_RC="$HOME/.config/ranger/rc.conf"
if ! grep -q "default_linemode devicons" "$RANGER_RC"; then
  echo "default_linemode devicons" >>"$RANGER_RC"
  echo "Added 'default_linemode devicons' to $RANGER_RC"
else
  echo "'default_linemode devicons' already exists in $RANGER_RC"
fi

echo "╭───────────────────────────────╮"
echo "│ Cloning Catppuccin Tmux Theme │"
echo "╰───────────────────────────────╯"
clone_repo "Catppuccin Tmux Theme" "https://github.com/catppuccin/tmux.git" "$HOME/.tmux/plugins/catppuccin" "v2.1.2"

echo "╭─────────────────────────╮"
echo "│ Installing Gaming Tools │"
echo "╰─────────────────────────╯"
install_packages "Gaming Tools" lutris lib32-mangohud mangohud wine-staging

echo "╭────────────────────────────────╮"
echo "│ Installing Lutris Dependencies │"
echo "╰────────────────────────────────╯"
install_dependencies "Lutris Dependencies" giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2-compat lib32-sdl2-compat

echo "╭────────────────────────────────────────────────────────────────╮"
echo "│ All packages, dependencies and plugins installed successfully! │"
echo "│                     Enjoy your system!                         │"
echo "╰────────────────────────────────────────────────────────────────╯"

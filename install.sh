#!/usr/bin/env bash
#
# sudo_env — dotfiles install script
# Sets up a new macOS machine with all configurations and tools.
#
# Usage: ./install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Starting sudo_env setup from: $DOTFILES_DIR"
echo ""

###############################################################################
# Xcode Command Line Tools                                                    #
###############################################################################

if ! xcode-select -p &>/dev/null; then
  echo "==> Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "    Re-run this script after Xcode CLT installation completes."
  exit 1
fi

###############################################################################
# Homebrew                                                                    #
###############################################################################

if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/brew/Brewfile"

###############################################################################
# Oh My Zsh                                                                   #
###############################################################################

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "==> Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "==> Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

###############################################################################
# nvm — Node Version Manager                                                  #
###############################################################################

if [ ! -d "$HOME/.nvm" ]; then
  echo "==> Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
fi

###############################################################################
# git-fuzzy                                                                   #
###############################################################################

if [ ! -d "$HOME/.git-fuzzy" ]; then
  echo "==> Installing git-fuzzy..."
  git clone https://github.com/bigH/git-fuzzy.git "$HOME/.git-fuzzy"
fi

###############################################################################
# Symlinks                                                                    #
###############################################################################

echo "==> Creating symlinks..."

symlink() {
  local src="$1"
  local dest="$2"
  local dest_dir
  dest_dir="$(dirname "$dest")"

  mkdir -p "$dest_dir"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "    Backing up $dest → ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi

  ln -sf "$src" "$dest"
  echo "    $dest → $src"
}

# Zsh
symlink "$DOTFILES_DIR/zsh/.zshrc"     "$HOME/.zshrc"
symlink "$DOTFILES_DIR/zsh/.zprofile"  "$HOME/.zprofile"
symlink "$DOTFILES_DIR/zsh/.aliases"   "$HOME/.aliases"
symlink "$DOTFILES_DIR/zsh/.functions" "$HOME/.functions"

# Git
symlink "$DOTFILES_DIR/git/.gitconfig"           "$HOME/.gitconfig"
symlink "$DOTFILES_DIR/git/.gitignore"           "$HOME/.gitignore"
symlink "$DOTFILES_DIR/git/.git-commit-template" "$HOME/.git-commit-template"

# Atuin
symlink "$DOTFILES_DIR/atuin/config.toml" "$HOME/.config/atuin/config.toml"

# Neovim
symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Background
mkdir -p "$HOME/background"
cp "$DOTFILES_DIR/background/biker.jpg" "$HOME/background/biker.jpg"

###############################################################################
# macOS defaults                                                              #
###############################################################################

read -p "==> Apply macOS system defaults? [y/N] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  bash "$DOTFILES_DIR/macos/setup.sh"
fi

###############################################################################
# Done                                                                        #
###############################################################################

echo ""
echo "==> All done!"
echo ""
echo "    Next steps:"
echo "    1. Edit ~/.gitconfig — fill in your name and email"
echo "    2. Add any API keys to the macOS Keychain — never store them in plain text files"
echo "    3. Log in to Atuin: atuin login && atuin sync"
echo "    4. Install a Ruby version: rbenv install 3.3.7 && rbenv global 3.3.7"
echo "    5. Install a Node version: nvm install --lts"
echo "    6. Restart your terminal"
echo ""

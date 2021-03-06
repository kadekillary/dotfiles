#!/usr/bin/env bash

# Install Xcode command line tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Check for latest version
brew update
# Upgrade already installed formulae
brew upgrade

# Get rid of terminal login details
touch .hushlogin

# Install brew utilities
brew install git
brew install curl
brew install python3
brew install coreutils
brew install tree
brew install gcc
brew install ccache
brew install cmake
brew install pkg-config
brew install autoconf
brew install automake
brew install inetutils
brew install tldr

# Install fzf
# Add options for installing completions + bindings
brew install fzf

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

brew cask install xquartz
brew cask install java
# add VisiData
# add AwsCLI

# Neovim setup
brew install neovim

# Fira Code
brew tap homebrew/cask-fonts
brew cask install font-fira-code

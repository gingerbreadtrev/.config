#!/usr/bin/env zsh

print
print "running setup script!"
print

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#    - install brewfile
brew install Brewfile

# symlink .zshrc
ln -s ~/.config/zsh/.zshrc ~/.zshrc

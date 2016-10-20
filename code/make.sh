#!/bin/bash

echo "Code stuff"

echo "Install xcode command line tools"
xcode-select --install

echo "Install brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install ruby"
brew install ruby

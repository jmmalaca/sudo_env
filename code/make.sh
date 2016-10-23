#!/bin/bash

echo "Code stuff"

echo "Install xcode command line tools"
xcode-select --install

#install brew stuff
chmod 755 brew.sh
./brew.sh

echo "Install ruby"
brew install ruby

#!/bin/bash¬

# Install Vim configurations¬
echo "Install Vim confs"
cd vim/
chmod 755 make.sh
./make.sh
cd..

# Install Tmux configurations
echo "Install Tmux confs"
cd tmux/
chmod 755 make.sh
./make.sh
cd ..

# Install dots files
echo "Install Dots Files"
cd dots/
chmod 755 make.sh
./make.sh
cd ..

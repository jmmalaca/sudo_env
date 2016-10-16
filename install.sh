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

# Install Dots Files
echo "Install Dots Files"
cd dots/
chmod 755 make.sh
./make.sh
cd ..

# Install Git Diff/Merge Tool
echo "Install Git Diff/Merge Tool"
cd git_ext_tool
chmod 755 make.sh
./make.sh
cd ..

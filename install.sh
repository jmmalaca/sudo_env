#!/bin/bash

echo "Install code stuff"
cd code
chmod 755 make.sh
./make.sh
cd ..

echo "Install Vim confs"
cd vim/
chmod 755 make.sh
./make.sh
cd..

echo "Install Tmux confs"
cd tmux/
chmod 755 make.sh
./make.sh
cd ..

echo "Install Dots Files"
cd dots/
chmod 755 make.sh
./make.sh
cd ..

echo "Install Git Diff/Merge Tool"
cd git_ext_tool
chmod 755 make.sh
./make.sh
cd ..

echo "Install fun stuff"
cd fun
chmod 755 make.sh
./make.sh
cd ..

#echo "Install some programs"
#cd programs
#chmod 755 make.sh
#./make.sh
#cd ..

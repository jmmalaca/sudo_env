#!/bin/bash

# copy dots files into your dots folder ´~/´

echo "Copy Dots files"

#we could do: 'cp -r .* ~/', but lets set here the list:
cp .aliases ~/.aliases  #about bash commands alias
source ~/.aliases

cp .bash_profile ~/.bash_profile   #bash configs, here is set the git-completion.bash
source ~/.bash_profile

cp .bash_prompt ~/.bash_prompt  #bash promp based on Solarized Dark theme
source ./.bash_prompt

cp .bashrc ~/.bashrc  #points to the bash_profile
source ~/.bashrc

cp .curlrc ~/.curlrc  #about curls

cp .exports ~/.exports  #eport command to set bash defaults
source ~/.exports

cp .functions ~/.functions  #bash functions, i.e. 'mkd' will create a new dir and go to it
source ~/.functions

cp .git-commit-template ~/.git-commit-template  #set git commits template
cp .gitconfig ~/.gitconfig  #git configs
cp .gitignore ~/.gitignore  #stuff to git ignore
cp .gitmodules ~/.gitmodules  #git modules

cp .gvimrc ~/.gvimrc  #vim configs

cp .inputrc ~/.inputrc  #bash input config

cp .rdebugrc ~/.rdebugrc  #needed for ruby on rails debug
source ~/.rdebugrc

cp .wgetrc ~/.wgetrc  #wget config

echo "copy git-completion"
cp git-completion.bash ~/git-completion.bash

echo "Setup macOS configs"
./osx

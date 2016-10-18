#!/bin/bash

# Install Vim configurations

echo "Install Vim confs"
if [[ $(ls -a ~/.vim) ]]; then
  echo "Copy Vim folders stuff"
  cp -r vim/*  ~/.vim/

  echo "Install Vim config"
  cp vimrc ~/.vimrc

	echo "Install Vim Plugin Manager, Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	echo "And install available Plugins"
	vim +PluginInstall +qall

	echo "Install rails plugin"
	git clone git://github.com/tpope/vim-rails.git ~/.vim/bundle/vim-rails
	git clone git://github.com/tpope/vim-bundler.git ~/.vim/bundle/vim-bundler

  echo "All good, write 'vim' to start,"
  echo "First of all, to install vim pluggins do on vim:"
  echo ":PluginInstall"
  echo "Enjoy :D"
else
  echo "Error: Vim folder not found."
fi

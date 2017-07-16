#!/bin/bash

# Build Tmux script

if ! [[ $(ls -a ~/.tmux) ]]; then
	echo "Clone Tmux"
	git clone https://github.com/tOOnPT/tmux.git

	if [ -d "tmux" ]; then
		echo "Install Tmux"
		cd tmux
		sh autogen.sh
		./configure && make
		cd ..
		rm -rf tmux/
	else
		echo "Clone tmux failed"
	fi
fi

if ! [[ $(ls -a ~/.tmux-powerline) ]]; then
	echo "Clone Tmux-powerline"
	git clone https://github.com/tOOnPT/tmux-powerline.git ~/

	echo "All good."
	echo "You can edit Tmux Status Bar on the file: '~/tmux-powerline/themes/mytheme.sh'"
fi

if [[ $(ls -a ~/.tmux.conf) ]]; then
	echo "Install Tmux-config"
	cp tmux.conf ~/.tmux.conf

	echo "Install tmux_completion.sh"
	cp tmux_completion.sh ~/.tmux_completion.sh

	echo "Reload config"
	tmux source-file ~/.tmux.conf

	echo "Install ~/.tmux/plugins/tmp"
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	echo "All good, write 'tmux' to start,"
	echo "Your tmux prefix-command is now: 'CTRL + a'"
	echo "First of all do: prefix + ( CTRL + I ) to install tmux pluggins"
	echo "Enjoy :D"

	echo "Tmux cheatsheet here: http://goo.gl/xLBhpw"
else
	echo "Tmux config file doesn't exists."
fi

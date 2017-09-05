##Vim

###Vim uses the vimrc file for configurations.

####Vimrc content for vim [plugins](https://vimawesome.com/):
* Vundle, will manage vundle itself and vim plugins
* Nerdtree, run on vim ":NERDTree" to open it
* Syntastic
* Vim-json
* YouCompleteMe
* Rainbow_parentheses
* Vim-tmux
* Colors plugins: molokai and vim-colorschemes

####Install Vim stuff
```bash
./make.sh
```

####Install Vim plugins
Open vim and on it run `:PluginInstall`. This command will make use of Vundle to install all plugins.

#### Note
Vim should be already installed on your system. You can check is version with the command `vim --version`
If not, you should install vim first and then install this configurations and plugins.

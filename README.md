# sudo_env

> Setup a nice env for you to work and play ;)

##What's around here:
* **[Tmux confs](#tmux)**
* **[Vim confs](#vim)**
* **[Dots files](#dots-files)**


---

<a name="tmux"/>
##Tmux
[Tmux](https://tmux.github.io) uses the tmux.conf file for configurations.

#### Tmux-config content:
* Remap prefix from 'C-b' to 'C-a'
* Split panes using | and -
* Reload config file with bind 'R'
* Switch panes using Alt-arrow without prefix
* Resize panes using k(down), i(up), j(left), l(right)
* Design changes on Panes/Status Bar/Messaging/Window Mode/Window Status/Info
* Loud or quiet?
* Modes/Panes/Statusbar/Messages colors

##### List of plugins used:
*  tmp
*  tmux-sensible
*  tmux-resurrect
*  tmux-continuum

#### Install Tmux
```bash
cd tmux/
./make.sh
```

#### Note
Remember, the config file is store on `~/.tmux.conf`


<a name="vim"/>
##Vim

###
Vim uses the vimrc file for configurations.

####Vimrc content for vim plugins:
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
cd vim/
./make.sh
```

####Install Vim plugins
Open vim and on it run ":PluginInstall". This command will make use of Vundle to install all plugins.

#### Note
Vim should be already installed on your system. You can check is version with the command "vim --version"
If not, you should install vim first and then install this configurations and plugins.


<a name="dots-files"/>
##Dots files



---


##Thanks to...


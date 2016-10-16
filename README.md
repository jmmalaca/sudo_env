# sudo_env

> Setup a nice env to work and play ;)


##What's around here:
* **[Tmux confs](#tmux)**
* **[Vim confs](#vim)**
* **[Dots files](#dots-files)**


## Installation

**Small Warning:** You will use at your own risk theses configs and files. These didn't blow up my system but just in case, review the files, the code, check that what is on the file is what you really want. There can be, in some dot file, stuff that you don't want on or off, and so you should comment or delete those lines. While you do it you will learn some stuff too so, enjoy the reading.

#### Install Vim/Tmux/DotsFiles stuff¬
```bash¬
./install.sh
```

---


<a name="tmux"/>
##Tmux

###[Tmux](https://tmux.github.io) uses the tmux.conf file for configurations.

#### Tmux-config content
* Remap prefix from 'C-b' to 'C-a'
* Split panes using | and -
* Reload config file with bind 'R'
* Switch panes using Alt-arrow without prefix
* Resize panes using k(down), i(up), j(left), l(right)
* Design changes on Panes/Status Bar/Messaging/Window Mode/Window Status/Info
* Loud or quiet?
* Modes/Panes/Statusbar/Messages colors
* and some more

##### List of plugins
*  tmp
*  tmux-sensible
*  tmux-resurrect
*  tmux-continuum
*  tmux-powerline

#### Install Tmux
```bash
cd tmux/
./make.sh
```

#### Note
Remember, the config file is store on `~/.tmux.conf`
and the config file for the tmux status bar is on '~/tmux-powerline/themes/mytheme.sh'

[Tmux-Cheatsheet](https://gist.github.com/tOOnPT/279f9adb004f217be1cee5a1c83cf7a5)


<a name="vim"/>
##Vim

###Vim uses the vimrc file for configurations.

####Vimrc content for vim plugins
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
This files are configuration files saved on the folder `~/`. To find them or you setup your system to show hidden files of you can go to your terminal and for instance `vim ~/.` plus tab key and you will see all those files.

####Dots available
* .curlrc #about curls
* .git-commit-template #the name explain what's about
* .gvimrc #about vim gui
* .git-completion.bash #about command completion with tab key
* .wgetrc #about wget
* .aliases #about shell commands aliases
* .exports #uses export command to set some shell defaults
* .inputrc #about shell inputs
* .bash_profile #shell configs, i.e. here is set the git-completion.bash file
* .functions #about shell function, i.e., 'mkd' command will create dir and enter it
* .gitconfig #about git stuff
* .osx* #about osx
* .bash_prompt #shell promp based on Solarized Dark theme
* .gitignore #ignore some stuff
* .rdebugrc #about ruby debug
* .bashrc #set bash profile file
* .gitmodules #set some git modules

---


##This repo was built based on repos shared by...
* [donbonifacio](https://github.com/donbonifacio/env)
* [paulosilva86](https://github.com/paulosilva86/dotfiles)
* [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
* [amix](https://github.com/amix/vimrc)
* [erikw](https://github.com/erikw/tmux-powerline)
* and by some info I found arround the web... ;)

# sudo_env

![alt tag](http://i1276.photobucket.com/albums/y474/cartoonfull/screen_zpsjghtgiqm.png)

> Setup a nice env to work and play ;)
Well, it started because I wanted to have a place from where I could bring my work env back but then it got bigger and now this is what I use right after a format to my laptop to set up everything for me.


## What's around here:
* **[Tmux confs](#tmux)**
* **[Vim confs](#vim)**
* **[Dots files](#dots-files)**
* **[Git Diff/Merge Tool](#git-tools)**
* **[Fun stuff](#fun-stuff)**
* **[Background image](#background)**
* **[Code](#code)**
* **[What's cool in here](https://github.com/tOOnPT/sudo_env/wiki/What%27s-cool-in-here)**

## Installation

**Small Warning:** You will use at your own risk theses configs and files. These didn't blow up my system but just in case, review the files, the code, check that what is on the file is what you really want. There can be, in some dot file, or event on the make scripts, stuff that you don't want, and so you should comment or delete those lines. While you do it you will learn some stuff too so, enjoy the reading.

#### Install Vim/Tmux/DotsFiles/GitTools stuff¬
```bash¬
./install.sh
```

##### This repository is a project always under construction


---


<a name="tmux"/>
## Tmux

### [Tmux](https://tmux.github.io) uses the tmux.conf file for configurations.

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
Remember, the config file is store on `~/.tmux.conf`, and the config file for the tmux status bar is on `~/tmux-powerline/themes/mytheme.sh`

[Tmux-Cheatsheet](https://gist.github.com/tOOnPT/279f9adb004f217be1cee5a1c83cf7a5)


---


<a name="vim"/>
## Vim

### Vim uses the vimrc file for configurations.

#### Vimrc content for vim plugins
* Vundle, will manage vundle itself and vim plugins
* Nerdtree, run on vim ":NERDTree" to open it
* Syntastic
* Vim-json
* YouCompleteMe
* Rainbow_parentheses
* Vim-tmux
* Colors plugins: molokai and vim-colorschemes

#### Install Vim stuff
```bash
cd vim/
./make.sh
```

#### Install Vim plugins
Open vim and on it run `:PluginInstall`. This command will make use of Vundle to install all plugins.

#### Note
Vim should be already installed on your system. You can check is version with the command `vim --version`
If not, you should install vim first and then install this configurations and plugins.


---


<a name="dots-files"/>
## Dots files
This files are configuration files saved on the folder `~/`. To find them or you setup your system to show hidden files of you can go to your terminal and for instance `vim ~/.` plus tab key and you will see all those files.

#### Dots available
* .curlrc #about curls
* .git-commit-template #setup template for git commits
* .gvimrc #about vim gui
* .git-completion.bash #about command completion with tab key
* .wgetrc #about wget
* .aliases #about shell commands aliases
* .exports #uses export command to set some shell defaults
* .inputrc #about shell inputs
* .bash_profile #shell configs, i.e. here is set the git-completion.bash file
* .functions #about shell function, i.e., 'mkd' command will create dir and enter it
* .gitconfig #about git stuff
* .osx #about osx
* .bash_prompt #shell promp based on Solarized Dark theme
* .gitignore #ignore some stuff
* .rdebugrc #about ruby debug
* .bashrc #set bash profile file
* .gitmodules #set some git modules


---

<a name="git-tools"/>
## Git Diff/Merge Tool
This tool is used so we can have and different look when doing `git diff` or `git merge`. Instead of using `vim` where I think is good but not good enought, with this external tool we have a good visualization of the changes on the files.

On this repository I already have the `P4V.dmg` for the instalation process but still, if you want you can download the latest version from [here](https://www.perforce.com/product/components/perforce-visual-merge-and-diff-tools) or even check from where I got the ideia, [here](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#External-Merge-and-Diff-Tools).

#### Install
````bash
./make.sh
````

#### Note:
I left here the P4V.dmg file to try out the new [Git Large File Storage](https://github.com/tOOnPT/git-lfs). Using this I can have this `.dmg` file on the repo without spending 100MB os space because of it.To use it too don't forget to install it:
````bash
brew install git-lfs
````
to start it:
````bash
git lfs init
````

and to push the files do:
````bash
git lfs pull
````

You just need to do it once so having this the Git LFS is all setup. Just to make sure you can see that on this repo we have the `P4V.dmg` file track by it using this command `git lfs track`.


---

<a name="fun-stuff"/>
## Fun stuff
Here is a make file to install some fun stuff we can have on our terminals.

It will install:
* ````bash
cowsay Hello
```` It will print on your terminal a cow saying Hello
* ````bash
fortune
```` It will print on your terminal a random fortune message
* ````bash
cowsay Hello | lolcat
```` or ````bash
fortune | lolcat
```` It will put some color on the text
* ````bash
cmatrix
```` It will transform you console to a matrix screen like the movie.

Simple things just for fun.


---


<a name="background"/>
## Background image
This has been my background image from some time now and honestly... why change ;)
So, on this repo there is a `background` folder having that image that is copied
to `~/.background/` folder when the `dots` files are instaled. Next, when the `osx` script runs, it sets this image as my background image. Change this if you like.


---


<a name="code"/>
## Code
This one will install some code stuff that we always need. Right now, the `make` script will try to install:
* xcode command line tools
* brew
* ruby


---


## This repo was built based on repos shared by...
* [donbonifacio](https://github.com/donbonifacio/env)
* [paulosilva86](https://github.com/paulosilva86/dotfiles)
* [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
* [amix](https://github.com/amix/vimrc)
* [erikw](https://github.com/erikw/tmux-powerline)
* and by some info I found arround the web... ;)

# sudo_env

![alt tag](http://i1276.photobucket.com/albums/y474/cartoonfull/screen_zpsjghtgiqm.png)

> Setup a nice env to work and play ;)


## What's around here:
* **[Tmux confs](#tmux)**
* **[Vim confs](#vim)**
* **[Dots files](#dots-files)**
* **[Git Diff/Merge Tool](#git-tools)**
* **[What's cool in here](#cool-stuff)**

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
* .osx* #about osx
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
and to start it:
````bash
git lfs init
````
You just need to do it once so having this the Git LFS is all setup. Just to make sure you can see that on this repo we have the `P4V.dmg` file track by it using this command `git lfs track`.


---


<a name="git-tools"/>
## What's cool in here

Let me give you a small check list with the main cool stuff so you can have a #cool quickstart:

* About `Tmux` stuff
 * We can enter Tmux commands by two ways:
  * using the `Prefix` + command you want in this context, what I have set is the `Prefix = Ctrl + "a"`
  * or entering `Prefix + ":"` where a command line appears so you can type tmux commands
 * These the ones that I use most:
  * `Prefix + ":"` to open a command line
  * For example, to start a new session you can type: `new -s <session_name>`
  * To kill a session type `kill-session -t <session_name>`
  * And to rename a session do `Prefix + "$"`, typing next the session name
  * To split the window in multiple panes you can do `Perfix +`:
   * `|` to split verticaly
   * `-` to split horizontaly
  * `Prefix + "x"` will remove a pane or a window where you are
  * To resize the panes use `Prefix +`:
   * `i` to expand up
   * `k` to expand down
   * `j` to expand to the right
   * `l` to expand to the left
 * Because we can change/update the `tmux.conf`file we need to reload it on tmux so do `Prefix + "R"`
 * And because we can update our dots files and sometimes we need to restart the terminal, instead of closing it you can do `Prefix + "X"`
 * A great feautre having tmux with the plugin ressurect and continum is that we can have the terminal closed and when restarted all your sessions are saved to be reloaeded so you can continue where you were. To use this do:
  * `Prefix + ( Ctrl + s )` save all sessions
  * `Prefix + ( Ctrl + r )` restore all sessions
 * Another cool feature of tmux is the copy-mode. This one is like having the copy and paste for your terminal text and sometimes can be handy.To Enter this mode do `Prefix + ( Alt + "[" )` and to exit `Prefix + ( Alt + "]" )`
  * On this copy-mode you can press the key `v` to start selecting what you want and then you can use `Prefix + ( Alt + "]" ) to paste what you have selected.

* About `Vim` stuff
 * The main stuff around vim are the plugin. Having installed these you will have a nice vim to work
 * Good coloring on the code and even nice coloring about parentheses. This can be handy with languages like Clojure
 * There is the `PluginInstall` command so you install all of them, use `:q` to close it
 * You can have a file system tree entering the command `:NERDTree`, use `:q` to close it
 * There's too one plugin to check your code sintax and one for completition
 * Vim has two modes, pressing `i` and its the `insert mode` and press `v` setting you on the `visual` mode
  * to exit from both modes use the `esq` key
 * Use the `insert` mode to type your text, code
 * And use the `visual` mode to use the ( copy or cut )  and paste feature
 * To use this cut/copy and paste feature first enter the `visual` mode. Then press `v` and select what you want. Next press `y` to copy or `c` to cut. Next put the cursor where you want to past and on the same mode press `p`

* About `Git` stuff
 * On the `.gitconfig` file there is setup what's the external tool to use when `diff` or `merge` and some others configs for git but for me the main cool stuff is about setting `alias` for git commands. So, instead of writting:
  * `git`, just type "g"
  * `git clone`, just type "g c"
  * `git status`, just type "g s"
  * `git checkout (having or not -b) <branch_name>`, jut type `g go <branch_name`
 * And so on... you can check them all on the `.gitconfig` file.

* On `Dots` files
 * TO DO


---


## This repo was built based on repos shared by...
* [donbonifacio](https://github.com/donbonifacio/env)
* [paulosilva86](https://github.com/paulosilva86/dotfiles)
* [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
* [amix](https://github.com/amix/vimrc)
* [erikw](https://github.com/erikw/tmux-powerline)
* and by some info I found arround the web... ;)

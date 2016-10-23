[ -n "$PS1" ] && source ~/.bash_profile;

#set for save the current working directory of the active pane for tmux status bar
# PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# alias dif="git-cola"

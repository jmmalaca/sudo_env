export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREEN="\[\033[0;32m\]"
export NO_COLOR="\[\e[0m\]"
export LIGHT_GREEN="\[\033[1;32m\]"
export CYAN="\[\033[0;36m\]"
export PS1="$LIGHT_GREEN\W$NO_COLOR"
export PS1="$PS1\$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/[$CYAN\1$NO_COLOR]/')$ "
export GREP_OPTIONS="--color"

source ~/.git-completion.bash
eval "$(rbenv init -)"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-$HOST-$ZSH_VERSION"
DISABLE_UPDATE_PROMPT=true

ZSH_THEME="jonathan"
ZSH_CUSTOM=$ZSH/custom

plugins=(vscode git ruby rails zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Use nvim locally, vim over SSH
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Custom aliases and functions
source ~/.aliases
source ~/.functions

# rbenv - Ruby version management
eval "$(rbenv init - zsh)"

# nvm - Node version management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Atuin - shell history sync and search
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# zsh-autosuggestions strategy using Atuin
autoload -U add-zsh-hook
zmodload zsh/datetime 2>/dev/null

_zsh_autosuggest_strategy_atuin() {
  suggestion=$(ATUIN_QUERY="$1" atuin search --cmd-only --limit 1 --search-mode prefix)
}
[[ -f ~/.atuin_config ]] && source ~/.atuin_config

# PATH additions
export PATH="$HOME/.git-fuzzy/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"

# API keys — fill these in after cloning, never commit actual values
# export ANTHROPIC_API_KEY="YOUR_API_KEY"

# OrbStack — only loaded if installed
[[ -f ~/.orbstack/shell/init.zsh ]] && source ~/.orbstack/shell/init.zsh 2>/dev/null

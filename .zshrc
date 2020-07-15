# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

## User configuration

# Enabling a 256-color Terminal
[ -z "$TMUX" ] && export TERM=xterm-256color

# Enable vim mode on command line
bindkey -v

# Add missing vim hotkeys
# Fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char

# History search in vim mode
# http://zshwiki.org/home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward

# Custom aliases
alias l="ls"
alias ll="ls -la"
alias sudo="sudo "

# Tmuxinator configurations
export EDITOR=nvim

# The future is now old man
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

unset SSH_ASKPASS

# Increase key speed via a rate change
xset r rate 300 50

# opam configuration
test -r /home/omedusyo/.opam/opam-init/init.zsh && . /home/omedusyo/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

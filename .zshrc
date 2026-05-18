# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

## User configuration

# Provides the ability to change the current working directory when exiting Yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

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

# e.g. `open test.html` opens the html file in the default browser
alias open="xdg-open"

# Tmuxinator configurations
export EDITOR=nvim

# The future is now old man
alias vim="/run/current-system/sw/bin/nvim"
alias vi="/run/current-system/sw/bin/nvim"
alias oldvim="/run/current-system/sw/bin/vim"

alias ns='nix-shell --run zsh'

# Increase key speed via a rate change
xset r rate 300 50

# ===PATHS===
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export LD_LIBRARY_PATH=/run/current-system/sw/lib:$LD_LIBRARY_PATH
export PATH="$HOME/kosmos/Applications/:$PATH"
export PATH="$HOME/.moon/bin:$PATH"

export DOTNET_ROOT=/run/current-system/sw/share/dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# moonbit
export PATH="$HOME/.moon/bin:$PATH"

alias l="ls"
alias sudo="sudo "

# Enabling a 256-color Terminal
[ -z "$TMUX" ] && export TERM=xterm-256color

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


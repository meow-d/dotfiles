## source system bashrc
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi


## env
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
PATH="$PATH:$HOME/.rvm/bin"
export PATH
source "$HOME/.cargo/env"


## aliases/functions
alias ..='cd ..'
alias s='sudo'
alias ls='eza --icons'
alias n="$EDITOR"
alias nn='sudoedit'

# automatically ls when cd
cd() {
    builtin cd "$@" && ls
}


## options
HISTCONTROL=ignoreboth:erasedups
HISTFILESIZE=99999
HISTSIZE=99999
shopt -s histappend
shopt -s histverify
shopt -s cmdhist

set -o noclobber
shopt -s checkwinsize

shopt -s direxpand
shopt -s autocd
shopt -s dirspell
shopt -s cdspell
shopt -s globstar
shopt -s extglob
shopt -s nocaseglob


## external
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
eval "$(starship init bash)"

# restore history sharing because starship breaks it?
# https://bluz71.github.io/2023/06/02/maximize-productivity-of-the-bash-shell.html
function history_sharing() {
    history -a && history -n
}
starship_precmd_user_func="history_sharing"


## bindings
# in order for the ctrl+z binding to work
stty susp undef
# rebind because fzf overrides undo defaults for whatever reason
bind '"\C-z": undo'

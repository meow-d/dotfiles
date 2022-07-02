### Keybindings
bind \e\[3\;5~ kill-word
bind \cH backward-kill-word


### Variables
set -x LC_ALL "en_US.UTF-8"

set fish_greeting
set -x STARSHIP_LOG "error"

set -x VISUAL "micro"
set -x EDITOR "micro"


### Functions
# auto ls when change directory
function list_dir --on-variable PWD
    ls
end


### Init
zoxide init fish | source
starship init fish | source

### Keybindings
bind \e\[3\;5~ kill-word
bind \cH backward-kill-word


### Variables
set -x LC_ALL "en_US.UTF-8"

set fish_greeting
set -x STARSHIP_LOG "error"

set -x VISUAL "micro"
set -x EDITOR "micro"
fish_add_path $HOME/.local/bin

### Functions
# auto ls when change directory
function list_dir --on-variable PWD
    ls
end


### Init
zoxide init fish | source
starship init fish | source
abbr -a -- f flatpak
abbr -a -- fi 'flatpak install'
abbr -a -- fs 'flatpak search'
abbr -a -- fu 'flatpak uninstall'
abbr -a -- n micro
abbr -a -- nn sudoedit
abbr -a -- p paru
abbr -a -- pi 'paru -S'
abbr -a -- pu 'paru -R'
abbr -a -- r rpm-ostree
abbr -a -- ri 'rpm-ostree install'
abbr -a -- ru 'rpm-ostree uninstall'
abbr -a -- s sudo
abbr -a -- za 'zoxide add'
abbr -a -- zq 'zoxide query'
abbr -a -- zqi zoxide\ query\ \\x2di
abbr -a -- zr 'zoxide remove'
abbr -a -- di 'sudo dnf install -y'

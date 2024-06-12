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
starship init fish | source

### abbr
abbr --add s "sudo"
abbr --add n "micro"
abbr --add nn "sudoedit"

abbr --add t "trash-put"

abbr --add xo "xdg-open"

abbr --add f "flatpak"
abbr --add fi "flatpak install"
abbr --add fs "flatpak search"
abbr --add fu "flatpak uninstall"

abbr --add r "rpm-ostree"
abbr --add --set-cursor ri "rpm-ostree install % && sudo rpm-ostree apply-live --allow-replacement"
abbr --add ru "rpm-ostree uninstall"

abbr --add d "sudo dnf"
abbr --add di "sudo dnf install -y"

abbr --add g "git"
abbr --add gs "git status"
abbr --add gc "git checkout"
abbr --add gb "git branch"

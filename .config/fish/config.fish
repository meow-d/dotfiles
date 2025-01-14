### Keybindings
bind \e\[3\;5~ kill-word
bind \cH backward-kill-word

### Variables
set -x LC_ALL "en_US.UTF-8"

set fish_greeting
set -x STARSHIP_LOG error

set -x VISUAL hx
set -x EDITOR hx
fish_add_path $HOME/.local/bin


### Functions
# auto ls when change directory
function list_dir --on-variable PWD
    ls
end


### Init
starship init fish | source


### abbr
abbr --add s sudo
abbr --add n $VISUAL
abbr --add nn sudoedit

abbr --add rm trash-put
abbr --add t trash-put

abbr --add xo xdg-open

abbr --add f flatpak
abbr --add fi "flatpak install"
abbr --add fs "flatpak search"
abbr --add fu "flatpak uninstall"

if command -v rpm-ostree >/dev/null
    abbr --add d rpm-ostree
    abbr --add --set-cursor di "rpm-ostree install % && sudo rpm-ostree apply-live --allow-replacement"
    abbr --add du "rpm-ostree uninstall"
else if command -v dnf >/dev/null
    abbr --add d "sudo dnf"
    abbr --add di "sudo dnf install -y"
    abbr --add du "sudo dnf remove -y"
end

abbr --add g git
abbr --add gs "git status"
abbr --add --set-cursor gcm "git commit . -m \"%\""
abbr --add gcn "git add . && git commit -a --no-edit --allow-empty-message && git push"
abbr --add gc "git checkout"
abbr --add gb "git branch"
abbr --add gm "git merge"

### pnpm
set -gx PNPM_HOME "/home/meow_d/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end


### fastfetch
if status is-interactive; and string match -r "xterm-kitty|xterm-ghostty" $TERM -q
    fastfetch
end

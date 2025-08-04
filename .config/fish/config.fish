### Keybindings
bind \e\[3\;5~ kill-word
bind \cH backward-kill-word


### Variables
set -x LC_ALL "en_US.UTF-8"

set fish_greeting
set -x STARSHIP_LOG error

set -x VISUAL nvim
set -x EDITOR $VISUAL
fish_add_path $HOME/.local/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/lib/flutter/bin
fish_add_path $HOME/.local/lib/dart-sdk/bin

set -gx PNPM_HOME "/home/meow_d/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

if command -v mise >/dev/null
  mise activate fish | source
end


### Functions
# auto ls when change directory
if status --is-interactive
    function list_dir --on-variable PWD
        ls
    end
end


### Init
starship init fish | source


### abbr
abbr --add s sudo
abbr --add n $VISUAL
abbr --add nn sudoedit
abbr --add vim nvim
abbr --add code "code --enable-features=UseOzonePlatform --ozone-platform=wayland"

abbr --add rm trash-put
abbr --add t trash-put

abbr --add xo xdg-open

## packages
abbr --add f flatpak
abbr --add fi "flatpak install"
abbr --add fs "flatpak search"
abbr --add fu "flatpak uninstall"

if command -v rpm-ostree >/dev/null
    abbr --add d rpm-ostree
    abbr --add di "rpm-ostree install -A"
    abbr --add du "rpm-ostree uninstall"
else if command -v dnf >/dev/null
    abbr --add d "sudo dnf"
    abbr --add di "sudo dnf install -y"
    abbr --add du "sudo dnf remove -y"
else if command -v pkg >/dev/null
    abbr --add d "pkg"
    abbr --add di "pkg install -y"
    abbr --add du "pkg uninstall -y"
else if command -v apt >/dev/null
    abbr --add d "sudo apt"
    abbr --add di "sudo apt install -y"
    abbr --add du "sudo apt remove -y"
end

## git
abbr --add g git
abbr --add gs "git status"

abbr --add ga "git add"
abbr --add gc "git commit"
abbr --add gcm --set-cursor "git commit -m \"%\""
abbr --add gcn "git add --all && git commit -a --no-edit --allow-empty-message; git pull && git push"

abbr --add gsw "git switch"
abbr --add gb "git branch"
abbr --add gm "git merge"
abbr --add gri "git rebase -i"

abbr --add gl "git l"
abbr --add gsh "git show"

abbr --add gst "git stash"
abbr --add gstp "git stash pop"

## for work
set device_width 412
abbr --add m --set-cursor 'string join "" (math -s 3 "% / $device_width * 100") vw | tee /dev/tty | wl-copy -n'


### fastfetch
if status is-interactive; and string match -r "xterm-kitty|xterm-ghostty" $TERM -q
    fastfetch
end

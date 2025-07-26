# meow_d's dotfiles
personal dotfiles, managed using yadm, not intended for public use obviously. screenshots are outdated because i'm lazy.

![screenshot](<.yadm/images/Screenshot from 2025-07-26 17-11-13.png>)

## setup
- os:
  - fedora workstation

- desktop:
  - niri
  - mako
  - fuzzel
  - waybar
  - wlogout

- terminal:
  - kitty
  - fish
  - starship prompt
  - fastfetch

- editor:
  - vscode (not included here)
  - neovim
  - neovim with neovide

- font:
  - mononoki nerd font
  - monofoki nerd font

## install
for my own reference

### install packages
- `sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null`
- `sudo dnf copr enable atim/starship`
- `dnf config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/Fedora_42/home:TheLocehiliosan:yadm.repo`
  - see: https://software.opensuse.org//download.html?project=home%3ATheLocehiliosan%3Ayadm&package=yadm&locale=en
- `sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`
- `sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1`
- `sudo dnf install -y code starship yadm fish kitty micro util-linux-user wl-clipboard git-credential-libsecret git syncthing adw-gtk3-theme brightnessctl qt5ct qt6ct niri mako zoxide ibus-panel nvim`

### clone dotfiles
- `yadm clone https://github.com/meow-d/dotfiles`

### flatpak
- `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`
- `flatpak remote-delete fedora`

### misc
- `git config --global credential.helper libsecret`
- `echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment > /dev/null`
- `fisher install kidonng/zoxide.fish`

## included but no longer using
- desktop:
  - kde plasma
    - i gotta be honest i'm not sure if the correct files are added, kde configs are a mess
    - modified the chromeos theme's window decoration, to match terminal theme
  - latte dock

- terminal:
  - zsh

- editor:
  - micro
    - atom one dark theme, but modified to use the terminal's background for the ✨ blur ✨
    - made a plugin to emulate the `ctrl + l` behaviour of vscode

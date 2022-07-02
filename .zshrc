#########
# Zinit #
#########
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"


#######################
# Save history config #
#######################
setopt INC_APPEND_HISTORY
setopt append_history
setopt extended_history

setopt hist_expire_dups_first
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


#####################
# ZSH/env Variables #
#####################
# Locale
export LC_ALL="en_US.UTF-8"

# Default text editor
export VISUAL=/usr/bin/micro
export EDITOR=/usr/bin/micro

# Ruby PATH
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# npm PATH
PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"

# Rust cargo PATH 
export PATH="$HOME/.cargo/bin:$PATH"

# Chrome
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

# history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(underline,fg=yellow)
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=(underline,fg=red)
HISTORY_SUBSTRING_SEARCH_FUZZY=yes
HISTORY_SUBSTRING_SEARCH_FUZZY=yes

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ctrl arrow key behaviour
WORDCHARS='~!#$%^&*(){}[]<>?.+;-='

# Starship logging
export STARSHIP_LOG='error'

###########
# plugins #
###########
# Turbo mode plugins
zi wait'0a' lucid for \
    atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down" \
        zsh-users/zsh-history-substring-search \
    marzocchi/zsh-notify \
    djui/alias-tips \
    katrinleinweber/oh-my-zsh-youtube-dl-aliases \
    zsh-users/zsh-completions \
    bilelmoussaoui/flatpak-zsh-completion \
    OMZ::plugins/git \
    OMZ::plugins/github \
    OMZ::plugins/pip \
    OMZ::plugins/python \
    OMZ::plugins/sudo \
    OMZ::plugins/archlinux \
    atload"_zsh_autosuggest_start; ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete accept-line history-substring-search-up history-substring-search-down); bindkey '^ ' 'autosuggest-clear' " \
        zsh-users/zsh-autosuggestions \

zi wait'0b' lucid for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \

# Prompt
#zi depth'1' for \
#    romkatv/powerlevel10k
eval "$(starship init zsh)"

zi light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

###############
# p10k config #
###############
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


############
# Keybinds #
############
bindkey '^H'      backward-kill-word
bindkey "^[[3;5~" kill-word
bindkey '^[[3~'   delete-char

bindkey '^z'      undo
bindkey '^Y'      redo

bindkey '^[[H'    beginning-of-line
bindkey '^[[F'    end-of-line

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# we already did that
#bindkey '^[[A'   history-substring-search-up
#bindkey '^[[B'   history-substring-search-down


###########
# aliases #
###########
alias    _="sudo"
alias -g ls="exa --icons"

alias    n="micro"
alias    nn="sudoedit"

alias -g p="paru"
alias    pi="p -S"
alias    pu="p -R"
alias    psyy="p -Syy"
alias    psyu="p -Syu"

alias -g y="paru"
alias    yi="y -S"
alias    yu="y -R"

alias    ytbb="yt-dlp -f bestvideo+bestaudio"
alias    icat="kitty +kitten icat"
alias    iwlrestart="_ modprobe -r iwlmvm iwlwifi && sleep 1 && _ modprobe iwlmvm iwlwifi"

alias    cat='bat'

#####################
# Coloured commands #
#####################
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
# not needed since we're using exa
#alias ls='ls --color=auto'


##############
# zsh config #
##############
setopt   AUTO_CD
setopt   correct
unsetopt correctall
setopt   share_history
setopt   ALWAYS_TO_END
setopt   AUTO_LIST
setopt   AUTO_MENU
setopt   AUTO_PARAM_SLASH
setopt   COMPLETE_IN_WORD
unsetopt MENU_COMPLETE
setopt   INTERACTIVE_COMMENTS
setopt   extended_glob
autoload -U select-word-style
unsetopt auto_name_dirs
unsetopt BEEP
select-word-style bash

setopt COMBINING_CHARS


####################
# Zsh completion #
####################
# make them case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# grouping
zstyle ':completion:*:*:*:*:descriptions' format '%B%F{cyan}-- %d --%f %b'
zstyle ':completion:*' group-name ''

# menu style
zstyle ':completion:*' menu select


#########
# other #
#########
# rbenv shell intergration
eval "$(rbenv init -)"

# automatic run ls on cd
function chpwd() {
    emulate -L zsh
    ls
}

# basic
setopt no_beep
setopt pushd_ignore_dups
setopt extended_glob

source ~/.zsh/completion.zsh
source ~/.zsh/history.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf [~/]*' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_STYLES[path]=''

source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

export GIT_EDITOR="vim"
export WORDCHARS=''

export ANDROID_SDK_HOME=$HOME/adt-bundle-mac/sdk
export PATH=/usr/local/bin:~/Dropbox/utils:$ANDROID_SDK_HOME/tools:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

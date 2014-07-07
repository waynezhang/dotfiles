# basic
setopt no_beep
setopt pushd_ignore_dups
setopt extended_glob

# customizations
source ~/.zsh/completion.zsh
source ~/.zsh/history.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/utils.zsh

# highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf [~/]*' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_STYLES[path]=''

# history search
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# color
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

# others
export GIT_EDITOR="vim"
export WORDCHARS=''

# path
export ANDROID_SDK_HOME=~/android-sdk
export PATH=/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/libexec:~/Dropbox/utils/dex2jar:~/Dropbox/utils:$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/platform-tools:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# z jump
if [[ `uname` == 'Darwin' ]]; then
[[ -s "`brew --prefix`/etc/profile.d/z.sh" ]] && . `brew --prefix`/etc/profile.d/z.sh
else
. /usr/local/z.sh
fi

# local only
[[ -s "$HOME/.zsh_custom.sh" ]] && . "$HOME/.zsh_custom.sh" ]]

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

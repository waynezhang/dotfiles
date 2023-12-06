# basic
#
setopt no_beep
setopt pushd_ignore_dups
setopt extended_glob

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS
export WORDCHARS=''
export GIT_EDITOR="vim"
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
export GPG_TTY=$(tty)

export PATH=/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/libexec:~/go/bin:$PATH

# plugins

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit snippet OMZ::lib/git.zsh
zinit ice svn; zinit snippet OMZ::plugins/git 

zinit ice silent wait'!0'; zinit light zsh-users/zsh-history-substring-search
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

zinit ice silent wait'!0'; zinit light changyuheng/fz
zinit ice silent wait'!0'; zinit light rupa/z
zinit ice silent wait'!0'; zinit light zsh-users/zsh-completions
zinit ice svn silent wait'!0'; zinit snippet OMZ::plugins/colored-man-pages

zinit ice slient wait'!0'; zinit light hchbaw/zce.zsh
bindkey "^Xz" zce
zstyle ':zce:*' fg 'fg=red,bold'
zstyle ':zce:*' bg 'fg=white'

function zsh_highlight_setup {
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
  ZSH_HIGHLIGHT_PATTERNS+=('rm -rf [~/]*' 'fg=white,bold,bg=red')
  ZSH_HIGHLIGHT_STYLES[path]=''
}
zplugin ice silent wait'!0' atload'zsh_highlight_setup'; zplugin light zsh-users/zsh-syntax-highlighting

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

for conf in "$HOME/.zsh.d/"*.zsh; do
  source "${conf}"
done
unset conf

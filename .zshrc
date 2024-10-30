# basic

setopt no_beep
setopt pushd_ignore_dups
setopt extended_glob

bindkey -e

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS
export WORDCHARS=''
export EDITOR="vim"
export GIT_EDITOR="vim"
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
export GPG_TTY=$(tty)

export PATH=/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/libexec:~/go/bin:$PATH

# plugins

source $HOMEBREW_PREFIX/opt/zinit/zinit.zsh

zinit ice silent wait'!0'; zinit light zsh-users/zsh-history-substring-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

zinit ice silent wait'!0'; zinit light changyuheng/fz
zinit ice silent wait'!0'; zinit light rupa/z
zinit ice silent wait'!0'; zinit light zsh-users/zsh-completions
zinit ice silent wait'!0'; zinit snippet OMZ::plugins/colored-man-pages
zinit ice silent wait'!0'; zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice silent wait'!0'; zinit snippet OMZ::plugins/starship/starship.plugin.zsh

zinit ice slient wait'!0'; zinit light hchbaw/zce.zsh
bindkey "^Xz" zce
zstyle ':zce:*' fg 'fg=red,bold'
zstyle ':zce:*' bg 'fg=white'

function zsh_highlight_setup {
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
  ZSH_HIGHLIGHT_PATTERNS+=('rm -rf [~/]*' 'fg=white,bold,bg=red')
  ZSH_HIGHLIGHT_STYLES[path]=''
}
zinit ice silent wait'!0' atload'zsh_highlight_setup'; zinit light zsh-users/zsh-syntax-highlighting

for conf in "$HOME/.zsh.d/"*.zsh; do
  source "${conf}"
done
unset conf

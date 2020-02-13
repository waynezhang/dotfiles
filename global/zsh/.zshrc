################################
# basic
################################

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setopt no_beep
setopt pushd_ignore_dups
setopt extended_glob

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS
export WORDCHARS=''
export GIT_EDITOR="vim"
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

################################
# plugins
################################

source "$HOME/.zplugin/bin/zplugin.zsh"

zplugin snippet OMZ::lib/git.zsh
zplugin ice svn; zplugin snippet OMZ::plugins/git 

zplugin ice silent wait'!0'; zplugin light zsh-users/zsh-history-substring-search
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

zplugin ice silent wait'!0'; zplugin light changyuheng/fz
zplugin ice silent wait'!0'; zplugin light rupa/z
zplugin ice silent wait'!0'; zplugin light zsh-users/zsh-completions
zplugin ice svn silent wait'!0'; zplugin snippet OMZ::plugins/colored-man-pages

function zsh_highlight_setup {
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
  ZSH_HIGHLIGHT_PATTERNS+=('rm -rf [~/]*' 'fg=white,bold,bg=red')
  ZSH_HIGHLIGHT_STYLES[path]=''
}
zplugin ice silent wait'!0' atload'zsh_highlight_setup'; zplugin light zsh-users/zsh-syntax-highlighting

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

################################
# completion
################################

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu yes select
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'

BREW_PREFIX="/usr/local/opt"
fpath=("$BREW_PREFIX"/zsh/share/zsh/functions $fpath)
autoload -U compinit && compinit

################################
# prompt
################################

setopt PROMPT_SUBST
autoload -U colors && colors

function precmd {
  local last_return_code=$?

  color=$fg[red]
  if [[ $? -eq 0 ]]; then
    color=$fg[gray]
  fi

  st=""
  if [[ -n $(/usr/bin/git status -s --ignore-submodules=dirty -uno 2>/dev/null | tail -n 1) ]]; then
    st=" ✘"
  fi

  branch="$(current_branch)"
  if [[ "$branch" != "" ]]; then
    branch=" $branch"
  fi

  PROMPT='%{$fg[cyan]%}%m %c%{$reset_color%}%{$fg[red]%}${branch}%{$reset_color%}%{$fg[yellow]%}${st}%{$reset_color%}'
  if [ $#jobstates -ne 0 ]; then
    PROMPT="${PROMPT} (%{$fg[green]%}%j%{$reset_color%})"
  fi
  PROMPT="${PROMPT} %(!.#.→) "

  RPROMPT=''
  if [ $last_return_code -ne 0 ]; then
    RPROMPT="→ %{$fg[red]%}$last_return_code%{$reset_color%}"
  fi
}

################################
# history
################################

HISTFILE="$HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_verify
setopt share_history

################################
# alias & functions
################################

alias gu="git-up"
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|QA|QA-mid)\s*$)" | command xargs -n 1 git branch -d'
alias gl='git pull upstream "$(current_branch)"'
alias ga='gu && gl'

alias vi="nvim"
alias vim="nvim"

alias ls='exa'

# files
alias -s zip="unzip"
alias -s gz="tar -zxvf"
alias -s tgz="tar -zxvf"
alias -s bz2="tar -jxvf"

setopt completealiases

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

################################
# path
################################

export PATH=/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/libexec:~/go/bin:$PATH

################################
# Google Cloud SDK
#################################

GCPSDKPATH="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
if [ -f "$GCPSDKPATH/google-cloud-sdk/path.zsh.inc" ]; then source "$GCPSDKPATH/path.zsh.inc"; fi
if [ -f "$GCPSDKPATH/google-cloud-sdk/completion.zsh.inc" ]; then source "$GCPSDKPATH/completion.zsh.inc"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_ALT_C_COMMAND='fd --type directory --color=always'

[[ -s ~/.zsh_custom.sh ]] && . ~/.zsh_custom.sh

eval "$(pyenv init -)"
eval "$(rbenv init -)"

export HOMEBREW_NO_AUTO_UPDATE=1

################################
# basic
################################

fpath=(`brew --prefix zplug`/repos/zsh-users/zsh-completions $fpath)
autoload -U compinit && compinit

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
#
export ZPLUG_HOME=/usr/local/opt/zplug
unset ZPLUG_CLONE_DEPTH
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-history-substring-search"
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

zplug "rupa/z", use:z.sh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "Seinh/git-prune"
zplug "plugins/git", from:oh-my-zsh
zplug "rimraf/k"
zplug "LuRsT/hr", as:command

zplug "hchbaw/zce.zsh"
bindkey "^Xz" zce

zplug "cocoalabs/2fb7dc2199b0d4bf160364b8e557eb66", from:gist, as:plugin, use:gistfile1.txt

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi
zplug load

# highlight
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf [~/]*' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_STYLES[path]=''

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

################################
# prompt
################################

setopt PROMPT_SUBST
autoload -U colors && colors

function precmd {
  color=$fg[red]
  if [[ $? -eq 0 ]]; then
    color=$fg[gray]
  fi

  st=""
  if [[ -n $(git status -s --ignore-submodules=dirty -uno 2>/dev/null | tail -n 1) ]]; then
    st=" ✘"
  fi

  branch="$(current_branch)"
  if [[ "$branch" != "" ]]; then
    branch=" $branch"
  fi

  PROMPT='%{$fg[cyan]%}%m %c%{$reset_color%}%{$fg[red]%}${branch}%{$reset_color%}%{$fg[yellow]%}${st}%{$reset_color%} %(!.#.→) '
  RPROMPT=' → %{$color%}$?%{$reset_color%}'
  if [ $#jobstates -ne 0 ]; then
    RPROMPT="%{$fg[green]%}%j%{$reset_color%}${RPROMPT}"
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

function gfeature { git checkout -b feature/CORE-$1 }
function gbug { git checkout -b bugfix/CORE-$1 }
alias gu="git up"
alias vi="vim"
setopt completealiases

################################
# path
################################

export PATH=/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/libexec:$PATH

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

eval "$(rbenv init - zsh)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

[[ -s ~/.zsh_custom.sh ]] && . ~/.zsh_custom.sh

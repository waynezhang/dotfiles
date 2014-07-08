setopt PROMPT_SUBST
autoload -U colors && colors

function git-branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo " ⭠ ${ref#refs/heads/}"
}

function git-status {
  st=$(git status -s --ignore-submodules=dirty -uno 2>/dev/null | tail -n 1)
  if [[ -n $st ]]; then
    echo " ø"
  fi
}

function precmd {
  if [[ $? -eq 0 ]]; then
    color=$fg[gray]
  else
    color=$fg[red]
  fi

  PROMPT='%{$fg[cyan]%}%c.%m%{$reset_color%}%{$fg[red]%}$(git-branch)%{$reset_color%}%{$fg[yellow]%}$(git-status)%{$reset_color%} %(!.#.→) '
  RPROMPT=' → %{$color%}$?%{$reset_color%}'
  if [ $#jobstates -ne 0 ]; then
    RPROMPT="%{$fg[green]%}%j%{$reset_color%}${RPROMPT}"
  fi
}

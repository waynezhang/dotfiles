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

alias gu="git up"
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|QA|QA-mid)\s*$)" | command xargs -n 1 git branch -d'

alias vi="nvim"
alias vim="nvim"

alias ls='exa'

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

setopt completealiases

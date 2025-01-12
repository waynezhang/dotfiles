alias gu="git up"
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|QA|QA-mid)\s*$)" | command xargs -n 1 git branch -d'

alias vi="nvim"
alias vim="nvim"

alias ls='eza'

function ya() { yadm add "$@"; yadm commit; }

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
function gud() { GIT_COMMITTER_DATE="$1" GIT_AUTHOR_DATE="$1" git commit --amend --no-edit --date "$1" }

setopt completealiases

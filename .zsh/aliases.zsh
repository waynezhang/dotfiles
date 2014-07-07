alias clj='rlwrap clj'
alias sqlite3='rlwrap sqlite3'
alias gst='git status'
alias gd='git diff'
alias gu='git up'
alias gp='git push'
alias gc='git commit'
alias csi='rlwrap csi'

if [[ `uname` == 'Darwin' ]]; then
alias ls='ls -Gp'
else
alias ls='ls --color'
fi

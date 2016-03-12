#/usr/bin/env bash

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log"
alias gg="git graph"

alias ls="ls -alGh"

alias tree="tree -C"
alias t2="tree -L 2"
alias t3="tree -L 3"

alias be="bundle exec"
alias serve="python -m SimpleHTTPServer"

alias hist="history"
alias uh="hist | sed -e 's/.*\([0-9]\{2\}:[0-9]\{2\}\) \{1,2\}\(.*\)/\2/' | sort | uniq"

alias count_words="grep -v \"^\s*$\" | sort | uniq -c | sort -bnr"


alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log"
alias gg="git graph"
alias gb="git branch"
alias gbr="git branch --remote"

alias ls='ls -GFh --color'
alias ll='ls -GFhl --color'
alias tree="tree -C"
alias be="bundle exec"
alias serve="python -m SimpleHTTPServer"

alias lint_dockerfile="docker run -it --rm -v "$PWD/Dockerfile.test":/Dockerfile:ro redcoolbeans/dockerlint"

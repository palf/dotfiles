#/usr/bin/env bash

export FZF_DEFAULT_COMMAND='ag -l -g ""'

fe() {
  local file
    file=$(fzf --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# fd - cd to selected directory
fd() {
  local dir
    dir=$(find ${1:-*} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

# fh - repeat history
fh() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
}

cdf() {
  local file
    local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fbr - checkout git branch
fbr() {
  local branches branch
    branches=$(git branch) &&
    branch=$(echo "$branches" | fzf +s +m) &&
    git checkout $(echo "$branch" | sed "s/.* //")
}

# fco - checkout git commit
fco() {
  local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
}

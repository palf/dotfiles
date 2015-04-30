#/usr/bin/env bash

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
}

clear="\e[0m"
intense="\e[1m"

black="\e[30m"
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
purple="\e[35m"
cyan="\e[36m"
white="\e[37m"

export PS1="\n$intense$blue\h: $white\w\n$yellow\$(parse_git_branch)$clear$white$ "


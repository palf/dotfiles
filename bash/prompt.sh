#/usr/bin/env bash

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

clear="\[\e[0m\]"
intense="\[\e[1m\]"

black="\[\e[30m\]"
red="\[\e[31m\]"
green="\[\e[32m\]"
yellow="\[\e[33m\]"
blue="\[\e[34m\]"
magenta="\[\e[35m\]"
cyan="\[\e[36m\]"
white="\[\e[37m\]"

host="$black\h"
current_folder="$blue\w"
git_branch="$red\$(parse_git_branch)"

time="$black\D{%T}"
history="$red\!"
symbol="🍺${blue}λ"

headline="$host $current_folder $git_branch"
baseline="$time $history $symbol"

export PS1="$clear
$headline $clear
$baseline $clear"


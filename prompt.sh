#/usr/bin/env bash

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

clear="\[\e[0m\]"
intense="\[\e[0m\]"

black="\[\e[30m\]"
red="\[\e[31m\]"
green="\[\e[32m\]"
yellow="\[\e[33m\]"
blue="\[\e[34m\]"
purple="\[\e[35m\]"
cyan="\[\e[36m\]"
white="\[\e[37m\]"

user_host="$intense$blue\h"
current_folder="$intense$red\w"
git_branch="$intense$purple\$(parse_git_branch)"

wrap() {
  echo "$1$clear"
}

lines=()
lines[0]="$(wrap $user_host)"
lines[1]="$(wrap $current_folder)"
lines[2]="$(wrap $git_branch)"

function join { local IFS="$1"; shift; echo "$*"; }

headline="$(join \| ${lines[@]})"

export PS1="$clear
$headline
$red\!$purple λ$clear "


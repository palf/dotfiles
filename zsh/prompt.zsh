function thing {
  local ref=$(=git symbolic-ref HEAD 2> /dev/null)
  local gitst="$(=git status 2> /dev/null)"

  if [[ -f .git/MERGE_HEAD ]]; then
    if [[ ${gitst} =~ "unmerged" ]]; then
      gitstatus="${PR_BOLD_RED}$(git_branch)"
    else
      gitstatus="${PR_BOLD_GREEN}$(git_branch)"
    fi
  elif [[ ${gitst} =~ "Changes to be committed" ]]; then
    gitstatus="${PR_BOLD_WHITE}$(git_branch)${PR_BOLD_YELLOW}"
  elif [[ ${gitst} =~ "use \"git add" ]]; then
    gitstatus="${PR_BOLD_WHITE}$(git_branch)${PR_BOLD_RED}"
  elif [[ -n `git checkout HEAD 2> /dev/null | grep ahead` ]]; then
    gitstatus="${PR_BOLD_WHITE}$(git_branch)${PR_BOLD_GREEN}"
  else
    gitstatus="${PR_BOLD_WHITE}$(git_branch)${PR_BOLD_BLUE}"
  fi

  if [[ -n $ref ]]; then
    echo "$gitstatus >%{$reset_color%} "
  else
    echo "${PR_BOLD_BLUE}>%{$reset_color%} "
  fi
}

function git_branch {
  local ref
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

  if [[ -n $ref ]]; then
    echo "${ref#refs/heads/}%{$reset_color%}"
  fi
}

PROMPT='$(thing)'

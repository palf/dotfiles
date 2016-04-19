function git_status {
  local ref=$(=git symbolic-ref HEAD 2> /dev/null)
  local gitst="$(=git status 2> /dev/null)"

  if [[ -f .git/MERGE_HEAD ]]; then
    if [[ ${gitst} =~ "unmerged" ]]; then
      gitstatus="${PR_BOLD_RED}unmerged "
    else
      gitstatus="${PR_BOLD_GREEN}merged "
    fi
  elif [[ ${gitst} =~ "Changes to be committed" ]]; then
    gitstatus="${PR_BOLD_GREEN}! "
  elif [[ ${gitst} =~ "use \"git add" ]]; then
    gitstatus="${PR_BOLD_RED}! "
  elif [[ -n `git checkout HEAD 2> /dev/null | grep ahead` ]]; then
    gitstatus="${PR_BOLD_YELLOW}* "
  else
    gitstatus=""
  fi

  if [[ -n $ref ]]; then
    echo "$gitstatus%{$reset_color%}"
  fi
}

function git_branch {
  local ref
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

  if [[ -n $ref ]]; then
    echo "${PR_BLUE}(${ref#refs/heads/})%{$reset_color%}"
  fi
}

PROMPT='$(git_status)${PR_BOLD_BLUE}%(!.#.»)%{$reset_color%} '
# RPROMPT='${PR_WHITE}%~%<<%{${reset_color}%}'
RPROMPT='$(git_branch)'

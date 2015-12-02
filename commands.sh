git log --author=".*" pretty=tformat: --numstat | awk '{ add += ; subs += ; loc +=  -  } END { printf added lines: %s, removed lines: %s, total lines: %sn, add, subs, loc }' -

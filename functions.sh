git_stats() {
	git log --author="$1" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
}

git_authors() {
	git log --format='%aN' | sort -u
}

gnb() {
	git fetch origin ; git co -b $1 origin/master ; git push your_remote $1 ; git branch --set-upstream-to=your_remote/$1
}

grb() {
	git fetch origin ; git rebase -i origin/master
}

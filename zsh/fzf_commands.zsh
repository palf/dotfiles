export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# fh - search history
fh() {
	([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s -m -x --reverse
}

# xfh - repeat history
xfh() {
	eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | tr -s ' ' | cut -d ' ' -f 3- | sort -u | fzf -x +s)
}

# fkill - kill process
fkill() {
	ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
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

fshow() {
	local out sha q
	while out=$(
		git log --graph --color=always \
			--format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
		fzf --ansi --multi --no-sort --reverse --query="$q" --print-query); do
		q=$(head -1 <<< "$out")
		while read sha; do
			git show --color=always $sha | less -R
		done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
	done
}

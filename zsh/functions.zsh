function extract {
	echo Extracting $1 ...
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1  ;;
			*.tar.gz)    tar xzf $1  ;;
			*.bz2)       bunzip2 $1  ;;
			*.rar)       unrar x $1    ;;
			*.gz)        gunzip $1   ;;
			*.tar)       tar xf $1   ;;
			*.tbz2)      tar xjf $1  ;;
			*.tgz)       tar xzf $1  ;;
			*.zip)       unzip $1   ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1  ;;
			*)        echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function strip_diff_leading_symbols {
	local color_code_regex="(\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])"

	# simplify the unified patch diff header
	sed -r "s/^($color_code_regex)diff --git .*$//g" | \
	sed -r "s/^($color_code_regex)index .*$/\n\1$(rule)/g" | \
	sed -r "s/^($color_code_regex)\+\+\+(.*)$/\1+++\5\n\1$(rule)\x1B\[m/g" |\

	# actually strips the leading symbols
	sed -r "s/^($color_code_regex)[\+\-]/\1 /g"
}

function docker_burn {
  for container in $(docker ps -a | grep "ago" | rev | tr -s " " "|" | cut -f 1 -d "|" | rev); do docker rm $container; done
}

function docker_burn! {
  for container in $(docker ps -a | grep "ago" | rev | tr -s " " "|" | cut -f 1 -d "|" | rev); do docker rm -f $container; done
}

function lowercase_extension {
  find . -name '*.*' -exec sh -c '
    a=$(echo "$0" | sed -r "s/([^.]*)\$/\L\1/");
    [ "$a" != "$0" ] && mv "$0" "$a" ' {} \;
}

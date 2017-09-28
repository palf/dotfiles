#!/usr/bin/env sh

less ./package.json | jq '.scripts | keys[]' | sed 's/"//g' | fzf --reverse --preview "less package.json | jq ' .scripts | .[\"{}\"] ' | sed 's/^\"//' | sed 's/\"$//' "

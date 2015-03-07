source ~/.bashrc
source ~/.aliases
source ~/projects/config/dotfiles/.fzf_commands

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
}

lightBlue="\[\033[1;34m\]"
white="\[\033[1;37m\]"
defaultGrey="\[\033[0;37m\]"
darkRed="\[\033[0;31m\]"
green="\[\033[0;32m\]"

SCRIPTS_PATH=$HOME/projects/scripts
ANDROID_PATH=$HOME/Development/android-sdk-macosx
NODE_PATH=/usr/local/lib/node_modules/grunt
CABAL_PATH=~/.cabal/bin

export PATH=$SCRIPTS_PATH:$ANDROID_PATH/platform-tools:$ANDROID_PATH/tools:$NODE_PATH:$CABAL_PATH:$PATH
export MACOSX_DEPLOYMENT_TARGET=10.9
export PS1="\n$lightBlue\h: $white\w\n$darkRed\$(parse_git_branch)$green>$defaultGrey "

alias ls="ls -alG"


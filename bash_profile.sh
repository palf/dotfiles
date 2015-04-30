source ~/.bashrc
source ~/.aliases
source ~/.fzf_commands
source ~/.prompt

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

SCRIPTS_PATH=$HOME/projects/scripts
ANDROID_PATH=$HOME/Development/android-sdk-macosx
NODE_PATH=/usr/local/lib/node_modules/grunt
CABAL_PATH=~/.cabal/bin

export PATH=$SCRIPTS_PATH:$ANDROID_PATH/platform-tools:$ANDROID_PATH/tools:$NODE_PATH:$CABAL_PATH:$PATH
export MACOSX_DEPLOYMENT_TARGET=10.9


source ~/.bashrc
source ~/.aliases
source ~/.fzf_commands
source ~/.bash_prompt

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

SCRIPTS_PATH=$HOME/projects/scripts
ANDROID_PATH=$HOME/Development/android-sdk-macosx
NODE_PATH=/usr/local/lib/node_modules/grunt
CABAL_PATH=~/.cabal/bin

export PATH=$SCRIPTS_PATH:$ANDROID_PATH/platform-tools:$ANDROID_PATH/tools:$NODE_PATH:$CABAL_PATH:$PATH
export MACOSX_DEPLOYMENT_TARGET=10.9

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

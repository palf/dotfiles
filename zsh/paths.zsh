export ANDROID_HOME=/home/palf/tools/android/sdk
MINICONDA_PATH=/home/palf/miniconda3/bin

export GOROOT=/usr/local/go
export GOPATH=$HOME/go

export PATH="$MINICONDA_PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

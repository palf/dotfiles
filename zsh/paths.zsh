ANDROID_PATH=/home/palf/tools/android/sdk/platform-tools
MINICONDA_PATH=/home/palf/miniconda3/bin

export GOROOT=/usr/local/go
export GOPATH=$HOME/go

export PATH="$MINICONDA_PATH:$ANDROID_SDK:$PATH"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

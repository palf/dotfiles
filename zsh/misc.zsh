export ZSH=/Users/palf/.oh-my-zsh

ZSH_THEME="af-magic"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git mvn grunt fzf)

export FIREFOX_PATH="/Applications/Firefox.app/Contents/MacOS"
export PATH="/usr/local/var/rbenv/shims:$FIREFOX_PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/var/rbenv/shims:/usr/local/opt/fzf/bin"

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

zstyle ":completion:*:commands" rehash 1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

eval "$(rbenv init -)"


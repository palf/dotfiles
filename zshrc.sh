export ZSH=/Users/palf/.oh-my-zsh

ZSH_THEME="af-magic"

DISABLE_AUTO_TITLE="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git tmux cabal lein themes fzf)

ANDROID_PATHS="/Users/palf/Development/android-sdk-macosx/platform-tools:/Users/palf/Development/android-sdk-macosx/tools"

PATH="/Users/palf/projects/scripts:$ANDROID_PATHS:/usr/local/lib/node_modules/grunt:/Users/palf/.cabal/bin:/Users/palf/.rbenv/shims:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/X11/bin:/Users/palf/projects/scripts:/Users/palf/Development/android-sdk-macosx/platform-tools:/Users/palf/Development/android-sdk-macosx/tools:/usr/local/lib/node_modules/grunt:/Users/palf/.cabal/bin:/Users/palf/.rbenv/shims:/Users/palf/.fzf/bin:/usr/local/opt/go/libexec/bin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

source $ZSH/oh-my-zsh.sh
source ~/.aliases

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
fpath=(/usr/local/share/zsh-completions $fpath)

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export EDITOR=vim

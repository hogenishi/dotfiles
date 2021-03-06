# brew error
export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/x11/bin:/usr/texbin:/Library/Python/2.7/site-packages"
alias brew="env PATH=${PATH/\/Users\/\.pyenv\/shims:/} brew"

# npm
export PATH=/usr/local/share/npm/bin:$PATH

#export PYTHONPATH="$HOME//lib/python2.6/site-packages/"
#export PYTHONPATH="$HOME/Library/Python/2.7/lib/python/site-packages:/usr/local/lib/python2.7/site-packages:/Library/Python/2.7/site-packages"
export NODE_PATH="/usr/local/lib/node_modules"
export NPM_PATH="/usr/local/bin/npm"
#export PATH="$PYTHONPATH:$NPM_PATH:$NODE_PATH:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Python virtualenv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# Virtualenvwrapper
#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#	export WORKON_HOME=$HOME/.virtualenvs
#	source /usr/local/bin/virtualenvwrapper.sh
#fi

# 補間
autoload -U compinit
compinit

# 文字コード
export LANG=ja_JP.UTF-8

# プロンプト
PROMPT='[%n@%m]# '
RPROMPT='[%d]'

# command correct edition before each completion attempt
setopt correct

# no beep sound when complete list displayed
setopt list_packed

# cdの省略
setopt auto_cd

# Completion configuration
autoload predict-on
predict-on

# 補完
autoload -U compinit
compinit

#PROMPT="%/%% "
PROMPT="%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]:] "

# lsの色付け
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# 便利なalias
alias ls="ls -G -w"
alias gls="gls --color"
alias where="command -v"
alias j="jobs -l"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"

# 補完の色付け
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# コマンドラインの引数でも補完を有効にする（--prefix=/userなど）
setopt magic_equal_subst

# 大文字小文字を区別しない（大文字を入力した場合は区別する）
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd

# auto_pushdで重複するディレクトリは記録しない
setopt pushd_ignore_dups

# history
HISTFILE=~/.zsh_history

# メモリ上に保存される件数（検索できる件数）
HISTSIZE=100000

# ファイルに保存される件数
SAVEHIST=100000

# MacVim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim'

# git
if which brew > /dev/null; then
	fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
else
	fpath=(~/.zsh/completion $fpath)
fi

autoload -U compinit
compinit -u

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' (%b)'
zstyle ':vcs_info:*' actionformats ' (%b|%a)'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%%%1(v|%F{green}%1v%f|) "


###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###


export PATH=$(brew --prefix)/bin:$PATH
eval "$(rbenv init -)"

export PGDATA=/usr/local/var/postgres

export NODEBREW_ROOT=/usr/local/var/nodebrew
export PATH=$NODEBREW_ROOT/current/bin:$PATH

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/X11/lib/pkgconfig


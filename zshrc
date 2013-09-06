#/bin/zsh
#--------------------------
# 基本設定
#--------------------------
HISTFILE=${HOME}/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_dups     #重複した履歴を保存しない
setopt auto_cd              #ディレクトリ名だけで移動
setopt nolistbeep           #ビープ音をならさない
setopt share_history        #複数端末での履歴共有
setopt extended_history     #履歴に日付も入れる
export WORDCHARS="*?_-.[]~&;!#$%^(){}<>" #C-wで単語境界にならない文字指定
export TODAY=`date +%Y%m%d`

#--------------------------
# ディレクトリスタック設定
#--------------------------
DIRSTACKSIZE=100
setopt AUTO_PUSHD
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors di=34 fi=0

#--------------------------
# 自作関数ファイル読み込み
#--------------------------
source ~/dotfiles/zsh/hs.sh
source ~/dotfiles/zsh/mkch.sh

#--------------------------
# gitのbranchをプロンプトに表示する設定
#--------------------------
setopt PROMPT_SUBST
source ~/dotfiles/git-prompt.sh

#--------------------------
# gitのブランチ名補完設定
#--------------------------
autoload -U compinit; compinit
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin
autoload bashcompinit
bashcompinit
zstyle ':completion:*:*:git:*' script ~/dotfiles/git-completion.zsh

#--------------------------
# プロンプト
#--------------------------
autoload colors
colors
local RED="%{${fg[red]}%}"
local BLUE="%{${fg[blue]}%}"
local YELLOW="%{${fg[yellow]}%}"
local GREEN="%{${fg[green]}%}"
local CYAN="%{${fg[cyan]}%}"
local PINK=$'%{\e[1;35m%}'
local END_COLOR="%{${reset_color}%}"
local BRANCH='$(__git_ps1 "[%s]")'

PROMPT="${GREEN}<%n@%U%m%u> ${END_COLOR}${PINK}[%~]${END_COLOR}
"
PROMPT=$PROMPT"[%*]$ "
RPROMPT=${BRANCH}

#--------------------------
# lsの色づけ
#--------------------------
export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls='ls -GF'

#--------------------------
# command
#--------------------------
alias vi='vim'
alias sr='screen'
alias tm='tmux'
alias tma='tmux a'
alias g='git'
alias mkdirp='mkch'
alias z='zsh'
alias hist='history -i 1'
alias history='history -i'
alias mkd='mkdir $TODAY'
alias cdd='cd $TODAY'

#ls系
case "${OSTYPE}" in
darwin*)
    alias ls="ls -G"
    alias la="ls -laG"
    alias ll="ls -lG"
    alias ltr="ls -ltrG"
;;
linux*)
    alias ls='ls --color'
    alias la='ls -la --color'
    alias ll='ls -l --color'
    alias ltr='ls -ltr --color'
    alias grep='grep --color'
;;
esac



CTAGSPATH="$HOME/dotfiles/bins/ctags-5.8j2/bin/ctags"
ls $CTAGSPATH > /dev/null 2>&1
if [ $? = 0 ]; then
    alias ctags="$CTAGSPATH"
fi

#--------------------------
# setting for git
#--------------------------
export GIT_EDITOR=vim

#--------------------------
# 環境変数追加
#--------------------------
export HOST=$host

#--------------------------
# 環境別の設定を読み込む
#--------------------------
HOST=`hostname|awk 'BEGIN{FS="."}{print $2}'`
if [ $HOST = sakura ]; then
    source ~/dotfiles/zshrc.sakura
fi

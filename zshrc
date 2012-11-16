#/bin/zsh
#--------------------------
# 基本設定
#--------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
setopt hist_ignore_dups     #重複した履歴を保存しない
setopt auto_cd              #ディレクトリ名だけで移動

#--------------------------
# gitのブランチ名補完設定
#--------------------------
autoload -U compinit; compinit
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin
source ~/dotfiles/git-completion.bash

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

PROMPT="${GREEN}<%n> ${END_COLOR}${PINK}[%~]${END_COLOR}
"
PROMPT=$PROMPT"[%*]$ "

#--------------------------
# command
#--------------------------
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'
alias ltrtail='ls -ltr|tail'
alias ltail='ls -ltr|tail'
alias vi='vim'
alias sr='screen'
alias g='git'

#--------------------------
# setting for git
#--------------------------
export GIT_EDITOR=vim

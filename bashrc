#!/bin/bash
#--------------------------
# サーバー情報があれば表示する
#--------------------------
if [ -f $HOME/server.txt ]
then
    si () {
        #command cd $1
        #ls -l
        cat $HOME/server.txt
    }
fi

# cdコマンド無しでcd
shopt -s autocd
# sudo でも補完
complete -cf sudo

#-------------------------
# prompt setting
#-------------------------
# gitのbranchをプロンプトに出したい
source $HOME/dotfiles/git-prompt.sh
function promps {

    GREEN="\[\e[92m\]"
    YELLOW="\[\e[93m\]"
    PINK="\[\e[95m\]"
    SH="\[\e[30;1m\]"
    END_COLOR="\[\e[0m\]"
    BRANCH='$(__git_ps1 "(%s)")'
    GIT_PS1_SHOWDIRTYSTATE=1
    unset PS1
    PS1=""
    PS1=$PS1"${GREEN}<\u@\h>${END_COLOR}"
    PS1=$PS1"${PINK}[\w]${END_COLOR}"
    PS1=$PS1"${SH}(bash)${END_COLOR}"
    PS1=$PS1"\n"
    PS1=$PS1"[\t]"
    PS1=$PS1"${YELLOW}${BRANCH}${END_COLOR}"
    PS1=$PS1"$ "
}
promps

#-------------------------
# command alias
#-------------------------
export TODAY=`date +%Y%m%d`
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'
alias ltrtail='ls -ltr|tail'
alias g='git'
alias gl='git log'
alias gst='git status'
alias mkd='mkdir $TODAY'
alias cdd='cd $TODAY'
alias mkdr='mkdir $TODAY && cd $TODAY'
alias ..='cd ../'

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

#set env for git
export GIT_EDITOR=vim

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

#-------------------------
# prompt setting
#-------------------------
# gitのbranchをプロンプトに出したい
function promps {
    S1='\[\ek\e\\\][\u@\h \W]\$ '

    source $HOME/dotfiles/git-prompt.sh
    GREEN="\e[092m"
    YELLOW="\e[093m"
    PINK="\e[095m"
    END_COLOR="\e[0m"
    BRANCH='$(__git_ps1 "(%s)")'
    GIT_PS1_SHOWDIRTYSTATE=1
    PS1="${debian_chroot:+($debian_chroot)}"
    PS1=$PS1"${GREEN}<\u@\h>\]${END_COLOR} "
    PS1=$PS1"${PINK}[\w]${END_COLOR}"
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

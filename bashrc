#!/bin/bash
#--------------------------
# サーバー情報があれば表示する
#--------------------------
if [ -f ~/server.txt ]
then
    si () {
        #command cd $1
        #ls -l
        cat ~/server.txt
    }
fi


export TODAY=`date +%Y%m%d`

#prompt setting
PS1='\[\ek\e\\\][\u@\h \W]\$ '

GREEN="\e[032m"
PINK="\e[035m"
END_COLOR="\e[0m"

PS1="${debian_chroot:+($debian_chroot)}"
PS1=$PS1"${GREEN}<\u@\h>\]${END_COLOR} "
PS1=$PS1"${PINK}[\w]${END_COLOR}"
PS1=$PS1"\n"
PS1=$PS1"[\t]\$ "


#command
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'
alias ltrtail='ls -ltr|tail'
alias vi='vim'
alias sr='screen'
alias z='zsh'
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

#set env for git
export GIT_EDITOR=vim

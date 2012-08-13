#prompt setting
PS1='\[\ek\e\\\][\u@\h \W]\$ '

GREEN="\e[032m"
PINK="\e[035m"
END_COLOR="\e[0m"

PS1='${debian_chroot:+($debian_chroot)}\e[032m<\u>\]\e[35m [\w]\n\e[0m[\t]\$ '
PS1='${debian_chroot:+($debian_chroot)}\e[032m<\u>\]\e[35w [\w]\n\e[0m[\t]\$ '
PS1='${debian_chroot:+($debian_chroot)}\e[032m<\u>\]\e[0m\$ '
PS1="${debian_chroot:+($debian_chroot)}${GREEN}<\u>\]${END_COLOR} ${PINK}[\w]${END_COLOR}\n[\t]\$ "

#command
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'
alias vi='vim'
alias sr='screen'

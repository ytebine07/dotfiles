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

#--------------------------
# 自作関数ファイル読み込み
#--------------------------
source ~/dotfiles/zsh/hs.sh
source ~/dotfiles/zsh/mkch.sh

#--------------------------
# gitのブランチ名補完,表示設定
#--------------------------
autoload -U compinit; compinit
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                             /usr/local/git/bin
setopt PROMPT_SUBST
source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-prompt.sh

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

PROMPT="${GREEN}<%U%m%u@%n> ${END_COLOR}${PINK}[%~]${END_COLOR}
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
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'
alias ltrtail='ls -ltr|tail'
alias ltail='ls -ltr|tail'
alias vi='vim'
alias sr='screen'
alias tm='tmux'
alias g='git'
alias mkdir='mkch'
alias mkdirp='mkdir'
alias z='zsh'
alias hist='history 1'

CTAGSPATH="$HOME/dotfiles/bins/ctags-5.8j2/bin/ctags"
ls $CTAGSPATH > /dev/null 2>&1
if [ $? = 0 ]; then
    alias ctags="$CTAGSPATH"
fi

#--------------------------
# キーバインド変更
#--------------------------
bindkey "^h" backward-char
bindkey "^l" forward-char
bindkey "^u" backward-delete-char

#--------------------------
# setting for git
#--------------------------
export GIT_EDITOR=vim

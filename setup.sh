#!/bin/bash

echo "##############################################"
echo "1.各種dotfileから自前の設定を読む"
echo "##############################################"
DOT_FILES=(
            .vimrc
            .bashrc
            .zshrc
)

for FILE in ${DOT_FILES[@]}
do
    TO_FILE=${FILE#\.}; #リンク先のファイル名から.を抜く
    if [ -f $HOME/$FILE ]; then
        if [ -L $HOME/$FILE ]; then
            echo "[$FILE]'s symlink already exists."
        else
            cat $HOME/$FILE | grep "source \$HOME/dotfiles/$TO_FILE" > /dev/null 2>&1
            if [ $? -eq 0  ]; then
                echo "[$FILE] already added source setting."
            else
                echo "[$FILE] add source to my setting."
                echo "source \$HOME/dotfiles/$TO_FILE" >> $HOME/$FILE
            fi
       fi
    else
        echo "[$FILE] create symlink."
        ln -s $HOME/dotfiles/$TO_FILE $HOME/$FILE
    fi
done

echo "##############################################"
echo "2.neobundle.vimを入れる"
echo "##############################################"
if [ ! -d ~/dotfiles/vim/plugins/neobundle.vim ]; then
    git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vim/plugins/neobundle.vim
else
    echo "[neobundle.vim] already exists."
fi

echo "##############################################"
echo "3.git-completion系を入れる"
echo "##############################################"
GIT_FILES=(
    git-completion.bash
    git-completion.zsh
    git-prompt.sh
)
for GFILE in ${GIT_FILES[@]}
do
    if [ ! -s $GFILE ]; then
        echo Download [$GFILE]
        curl -s -f -L https://raw.github.com/git/git/master/contrib/completion/$GFILE > $GFILE
    else
        echo "[$GFILE] already exists."
    fi
done

echo "##############################################"
echo "4.gitの設定"
echo "##############################################"
git config --global user.name > /dev/null 2>&1
if [ $? -ne 0 ]; then
    read -p "Enter your git user.name [ytebine07]: " GITUSERNAME
    GITUSERNAME=${GITUSERNAME:-ytebine07}
    git config --global user.name "$GITUSERNAME"
fi
git config --global user.email > /dev/null 2>&1
if [ $? -ne 0 ]; then
    read -p "Enter your git user.email [ytebine07@gmail.com]: " GITUSEREMAIL
    GITUSEREMAIL=${GITUSEREMAIL:-ytebine07@gmail.com}
    git config --global user.email "$GITUSEREMAIL"
fi
git config --local user.name ytebine07
git config --local user.email ytebine07@gmail.com

git config --global alias.br "branch"
git config --global alias.co "checkout"
git config --global alias.st "status"
git config --global color.ui auto
echo "[config global list]"
git config --global --list
echo ""
echo "[config local list]"
git config --local --list

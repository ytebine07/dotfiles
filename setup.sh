#!/bin/bash

echo "##############################################"
echo "1.各種dotfileから自前の設定を読む"
echo "  dotfileが存在しなければ、シンボリックリンクを貼る"
echo "  dotfileが存在していれば、sourceコマンドを追記する"
echo "##############################################"
DOT_FILES=(
            .vimrc
            .bashrc
            .zshrc
)

for FILE in ${DOT_FILES[@]}
do
    # リンク先のファイル名を用意する
    TO_FILE=${FILE#\.};

    if [ -f $HOME/$FILE ]; then
        if [ -L $HOME/$FILE ]; then
            # シンボリックリンクが存在した場合は何もしない
            echo "[$FILE] symlink already exists."
        else
            cat $HOME/$FILE | grep "source \$HOME/dotfiles/$TO_FILE" > /dev/null 2>&1
            if [ $? -eq 0  ]; then
                # dotfileが存在するが、自前設定を読み込む記述がすでにあれば何もしない
                echo "[$FILE] already added source setting."
            else
                # dotfileが存在するが、自前設定を読み込む記述がない場合は追記する
                echo "[$FILE] add source to my setting."
                echo "source \$HOME/dotfiles/$TO_FILE" >> $HOME/$FILE
            fi
       fi
    else
        # シンボリックリンクが存在しない場合はシンボリックリンクを作成する
        echo "[$FILE] create symlink."
        ln -s $HOME/dotfiles/$TO_FILE $HOME/$FILE
    fi
done

echo ""
echo "##############################################"
echo "2.neobundle.vimを入れる"
echo "##############################################"
if [ ! -d ~/dotfiles/vim/plugins/neobundle.vim ]; then
    git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vim/plugins/neobundle.vim
else
    echo "[neobundle.vim] already exists."
fi

#echo "##############################################"
#echo "3.git-completion系を入れる"
#echo "##############################################"
#GIT_FILES=(
#    git-completion.bash
#    git-completion.zsh
#    git-prompt.sh
#)
#for GFILE in ${GIT_FILES[@]}
#do
#    if [ ! -s $GFILE ]; then
#        echo Download [$GFILE]
#        curl -s -f -L https://raw.github.com/git/git/master/contrib/completion/$GFILE > $GFILE
#    else
#        echo "[$GFILE] already exists."
#    fi
#done

echo ""
echo "##############################################"
echo "4.gitの設定"
echo "  グローバルのuser.nameを設定"
echo "  グローバルのuser.emailを設定"
echo "  gitコマンドのAliasを設定"
echo "##############################################"
git config --global user.name > /dev/null 2>&1
if [ $? -ne 0 ]; then
    read -p "Enter your global git user.name [ytebine07]: " GITUSERNAME
    GITUSERNAME=${GITUSERNAME:-ytebine07}
    git config --global user.name "$GITUSERNAME"
fi
git config --global user.email > /dev/null 2>&1
if [ $? -ne 0 ]; then
    read -p "Enter your global git user.email [ytebine07@gmail.com]: " GITUSEREMAIL
    GITUSEREMAIL=${GITUSEREMAIL:-ytebine07@gmail.com}
    git config --global user.email "$GITUSEREMAIL"
fi

# このディレクトリは個人でしか修正しないのでユーザー名等は固定
git config --local user.name ytebine07
git config --local user.email ytebine07@gmail.com

# gitコマンドにAliasを貼る
git config --global alias.br "branch"
git config --global alias.co "checkout"
git config --global alias.st "status"
git config --global color.ui auto

# 設定後の値を表示
echo "[config global list]"
git config --global --list
echo ""
echo "[config local list]"
git config --local --list

echo ""
echo "##############################################"
echo "4-1.starshipを入れる"
echo "##############################################"
STARSHIP_PATH='/usr/local/bin/starship'
if [ -f $STARSHIP_PATH ]; then
    echo "[starship] already installed."
else
    echo "Download starship."
    curl -sS https://starship.rs/install.sh | sh
fi

echo ""
echo "##############################################"
echo "4-2.starship設定ファイル"
echo "##############################################"
STARSHIP_CONFIG_DIR_PATH="$HOME/.config"
# ~/.config/フォルダが無ければ作成する
if [ ! -d $STARSHIP_CONFIG_DIR_PATH ]; then
    echo "[starship].configディレクトリを作ります"
    mkdir -p $STARSHIP_CONFIG_DIR_PATH
fi

# configファイルへシンボリックリンクを貼る
STARSHIP_CONFIG_FILE_PATH="$HOME/.config/starship.toml"
if [ ! -L $STARSHIP_CONFIG_FILE_PATH ]; then
    echo "[starship]starship.tomlへのシンボリックリンク作成"
    ln -s $HOME/dotfiles/starship.toml $STARSHIP_CONFIG_FILE_PATH
fi

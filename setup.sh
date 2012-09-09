#/bin/bash


##############################################
# 1.各種dotfileへのsymlinkを張る
##############################################
DOT_FILES=( .vimrc 
            .bashrc
            .screenrc )

for FILE in ${DOT_FILES[@]}
do
    #リンク先のファイル名から.を抜く
    TO_FILE=${FILE#\.};
    ln -s $HOME/dotfiles/$TO_FILE $HOME/$FILE
done


##############################################
# 2.neobundle.vimを入れる
##############################################
git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vim/neobundle.vim

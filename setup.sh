#/bin/bash


##############################################
# 1.各種dotfileへのsymlinkを張る
##############################################
DOT_FILES=( .vimrc
            .gvimrc
            .bashrc
            .zshrc
            .screenrc
            .tmux.conf)

for FILE in ${DOT_FILES[@]}
do
    #リンク先のファイル名から.を抜く
    TO_FILE=${FILE#\.};
    ln -s $HOME/dotfiles/$TO_FILE $HOME/$FILE
done


##############################################
# 2.neobundle.vimを入れる
##############################################
git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vim/plugins/neobundle.vim

##############################################
# 3.git-completion.bashを入れる
##############################################
curl -k https://raw.github.com/git/git/master/contrib/completion/git-completion.bash > git-completion.bash
curl -k https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh > git-completion.zsh
curl -k https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > git-prompt.sh

##############################################
# 4.binディレクトリを作る
##############################################
mkdir ./bins/

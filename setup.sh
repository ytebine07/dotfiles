#/bin/bash


##############################################
# 1.各種dotfileから自前の設定を読む
##############################################
echo "1.各種dotfileから自前の設定を読む"
DOT_FILES=(
            .vimrc
            .bashrc
            .zshrc
          )

for FILE in ${DOT_FILES[@]}
do
    #リンク先のファイル名から.を抜く
    TO_FILE=${FILE#\.};
    if [ -f $HOME/$FILE ]; then
        echo "[$FILE] already exists."
        echo "   echo \"source \$HOME/dotfiles/$TO_FILE\" >> \$HOME/$FILE  "

    else
        echo "create symlink -> $FILE"
        ln -s $HOME/dotfiles/$TO_FILE $HOME/$FILE
    fi
done

##############################################
# 2.neobundle.vimを入れる
##############################################
echo "2.neobundle.vimを入れる"
if [ ! -d ~/dotfiles/vim/plugins/neobundle.vim ]; then
    git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vim/plugins/neobundle.vim
fi

##############################################
# 3.git-completion.bashを入れる
##############################################
echo "3.git-completion.bashを入れる"
if [ ! -s git-completion.bash ]; then
    echo "nai"
    curl -s -f -L https://raw.github.com/git/git/master/contrib/completion/git-completion.bash > git-completion.bash
fi
if [ ! -s git-completion.zsh ]; then
    curl -s -f -L https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh > git-completion.zsh
fi
if [ ! -s git-prompt.sh ]; then
curl -s -f -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > git-prompt.sh
fi
##############################################
# 4.gitのショートカット
##############################################
echo "4.gitのショートカット"
git config --global alias.br "branch"
git config --global alias.co "checkout"
git config --global alias.st "status"
git config --global color.ui auto

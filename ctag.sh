#/bin/zsh
#----------------------------
#   ctagsの実行ファイルを自動インストールするスクリプト
#----------------------------

#各種ディレクトリ設定
INS_DIR=~/dotfiles/bins/
CTAGS_URL=http://hp.vector.co.jp/authors/VA025040/ctags/downloads/ctags-5.8j2.tar.gz
CTAGS_FILE=ctags-5.8j2.tar.gz
PREFIX=~/dotfiles/bins/ctags-5.8j2
CHDIRSH=chdir.sh

# ctags-5.8j2.tar.gzの取得
curl $CTAGS_URL > $INS_DIR$CTAGS_FILE
tar xzvf $INS_DIR$CTAGS_FILE -C $INS_DIR 2> /dev/null

#  ディレクトリ移動のためのテクニック
echo "#/bin/zsh" > $CHDIRSH
echo "cd ./bins/ctags-5.8j2/" >> $CHDIRSH
. $CHDIRSH
rm ../../$CHDIRSH

# 実行ファイルの作成
./configure --prefix=$PREFIX
make
make install

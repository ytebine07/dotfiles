#/bin/zsh

#
#引数で指定したディレクトリが無ければ作成して移動
#あればそこに移動
function mkch(){
    if [[ -d  $1 ]]; then
        cd $1
    else
        mkdir -p $1 && cd $1
    fi
}

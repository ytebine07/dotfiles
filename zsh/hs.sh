#/bin/zsh

#HISTFILE内に記載された、いつ実行されたか情報を
#わかりやすい形で出力する。
function hs(){
    AWK=/usr/local/bin/awk
    ls $AWK> /dev/null 2>&1
    if [ $? = 1 ]; then
        AWK=`which awk`
    fi

    cat -n $HISTFILE | $AWK '{print  $1,
                             "",
                             strftime("%F %H:%M:%S", substr($3,1,10) ),
                             " ",
                             substr($0,23,length($0))
                            }'
}

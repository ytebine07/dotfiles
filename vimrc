:se	number                  "行数表示
:se	si                      "新しく行を作ったとき、自動インデントを行う
:se	makeprg=gmake           "makeを行うプログラムの選択
:se	makeef=./vim##.err      "makeのエラーや、grep検索結果を出力するファイル名
:se	matchtime=15            "maechparisで表示する時間
:se	hlsearch                "検索結果をハイライト表示する
:se	title                   "windowにファイル名表示
:syntax	on                  "色付け表示 on
:filetype	on              "開いているファイルのタイプ
:se	sm                      "閉じカッコが入力されたとき、対応カッコをハイライト
:se	wildmenu                "補完候補を表示する
:se	backspace=2             "バックスペースの動作を決める
:se	ruler                   "カーソルの位置を表示する
:se	fdm=marker              "折り畳む種類
:se tw=0                    "行が長くなっても、勝手に折り返さない

"Vimのメッセージのハイライト表示の指定
:se	expandtab
:se	shiftwidth=4
:se	softtabstop=4
:se	tabstop=4
"ts=タブの幅 sw=自動インデント時のタブの幅

"--------------------------------------------
" 便利なマップ関係
"--------------------------------------------
"()系のマップ
inoremap {{ {}<LEFT>
inoremap (( (  )<LEFT><LEFT>
inoremap [[ []<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap << <><LEFT>

"移動系のマップ
inoremap <C-h>  <LEFT>
inoremap <C-k>  <UP>
inoremap <C-l>  <RIGHT>
inoremap <C-j>  <DOWN>
inoremap ;;     <END>

"コマンドモードへ戻るとき<C-c>では
"InsertLeaveが検知できないのでマップ。
inoremap <C-c> <C-ESC>     

"vimrc再読み込み
map <Space>r :source ~/.vimrc

"--------------------------------------------
" ステータスラインの設定
"--------------------------------------------
set laststatus=2        "ステータスラインの行数

"vim起動時のステータスラインの色
hi Statusline 
            \    guifg=Yellow
            \    guibg=DarkGray
            \    gui=none
            \    ctermfg=Yellow
            \    ctermbg=DarkGray
            \    cterm=none

"コマンドモードの時のステータスライン色
au InsertLeave * hi Statusline 
            \    guifg=Yellow
            \    guibg=DarkGray
            \    gui=none
            \    ctermfg=Yellow
            \    ctermbg=DarkGray
            \    cterm=none

"インサートモードの時のステータスライン色
au InsertEnter * hi Statusline 
            \   guifg=DarkBlue
            \   guibg=DarkYellow
            \   gui=none
            \   ctermfg=Blue
            \   ctermbg=Yellow
            \   cterm=none

"--------------------------------------------
" 色やカラースキーマの設定
"--------------------------------------------
set t_Co=256                "256色設定
:colorscheme molokai
":colorscheme darkblue
":colorscheme zenburn


"--------------------------------------------
" neobundleの設定
"--------------------------------------------
set nocompatible
filetype off

if has('vim_starting')
    "neobundleの場所
    set runtimepath+=~/.vim/bundle/neobundle/
    "プラグインの展開場所 
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

"強力補完機能
NeoBundle 'Shougo/neocomplcache'

"neocomplcacheのスニペットを使う
NeoBundle 'Shougo/neocomplcache-snippets-complete' 

"Vimの中でShellを起動する
NeoBundle 'Shougo/vimshell'

" vim-scripts リポジトリ (1)
 
" github の任意のリポジトリ (2)
NeoBundle "tpope/vim-fugitive"
 
" github 以外のリポジトリ (3)
NeoBundle "git://git.wincent.com/command-t.git"
 
filetype plugin indent on



"--------------------------------------------
" neocomplchacheの設定
"--------------------------------------------
"起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
"<S-TAB>が効かないけど一応書いておく。
"時間があったら調べる。
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"


"スニペットの設定
"<C-k>で、上に移動とスニペット補完両方やりたい。
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<Up>"


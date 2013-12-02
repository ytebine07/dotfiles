"--------------------------------------------
" MacVimでしか呼ばれないようになっている設定たち
"--------------------------------------------
source  ~/dotfiles/vim/vimrc.neobundle

colorscheme xoria256
set nobackup            "チルダ付ファイルを作成しない
set backupdir=/tmp/

"MacVimでsjisを文字化けさせないようにする設定
set enc=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,utf-8,euc-jp,cp932

"MacVimでノーマルモード戻る際に、日本語IMEをOFFにしてくれる設定
"http://qiita.com/kenjiskywalker/items/6ccaf6fb8f1f139230e6
if has('multi_byte_ime') || has('xim') 
  highlight Cursor guifg=NONE guibg=White
  highlight CursorIM guifg=NONE guibg=DarkRed
endif



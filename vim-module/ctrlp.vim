"----------------------------------------------------------
" インストール
"----------------------------------------------------------
" 多機能セレクタ
NeoBundle 'ctrlpvim/ctrlp.vim'
" CtrlPの拡張プラグイン. 関数検索
NeoBundle 'tacahiroy/ctrlp-funky'
" CtrlPの拡張プラグイン. コマンド履歴検索
NeoBundle 'suy/vim-ctrlp-commandline'

"----------------------------------------------------------
" CtrlPの設定
"----------------------------------------------------------
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
let g:ctrlp_extensions = ['funky', 'commandline'] " CtrlPの拡張として「funky」と「commandline」を使用

"let g:ctrlp_custom_ignore = '\v[\/](node_modules|build)$'
"let g:ctrlp_custom_ignore = 'vendor\|DS_Store\|git'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
"
".gitignoreに書き込まれたファイルを無視するようになる
"https://qiita.com/mogulla3/items/38e384847fb0cdb0ce5d
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" CtrlPCommandLineの有効化
command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())

" CtrlPFunkyの有効化
let g:ctrlp_funky_matchtype = 'path'

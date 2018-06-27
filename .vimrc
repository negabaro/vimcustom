if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'

let g:neobundle_default_git_protocol='https'

"terraform code整形
NeoBundle 'hashivim/vim-terraform'
let g:terraform_fmt_on_save = 1

"https://qiita.com/koyopro/items/c473b3c2323501b7891a
"https://qiita.com/ahiruman5/items/4f3c845500c172a02935
"できた。自動補完
"----------------------------------------------------------
" インストール
"----------------------------------------------------------
if has('lua') " lua機能が有効になっている場合・・・・・・①
    " コードの自動補完
    NeoBundle 'Shougo/neocomplete.vim'
    " スニペットの補完機能
    NeoBundle "Shougo/neosnippet"
    " スニペット集
    NeoBundle 'Shougo/neosnippet-snippets'
endif

"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
if neobundle#is_installed('neocomplete.vim')
    " Vim起動時にneocompleteを有効にする
    let g:neocomplete#enable_at_startup = 1
    " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
    let g:neocomplete#enable_smart_case = 1
    " 3文字以上の単語に対して補完を有効にする
    let g:neocomplete#min_keyword_length = 3
    " 区切り文字まで補完する
    let g:neocomplete#enable_auto_delimiter = 1
    " 1文字目の入力から補完のポップアップを表示
    let g:neocomplete#auto_completion_start_length = 1
    " バックスペースで補完のポップアップを閉じる
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
    "imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
    "imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif


"https://qiita.com/alpaca_taichou/items/056a4c42fe7a928973e6

NeoBundle 'mattn/emmet-vim'


"css,javascript,html syntax auto indent
"https://qiita.com/ahiruman5/items/4f3c845500c172a02935
"indent可視化
NeoBundle 'Yggdroot/indentLine'

"
"https://qiita.com/alpaca_taichou/items/056a4c42fe7a928973e6
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
"NeoBundle 'othree/html5.vim'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'pangloss/vim-javascript'

" カラースキームmolokai
NeoBundle 'tomasr/molokai'
" ステータスラインの表示内容強化
NeoBundle 'itchyny/lightline.vim'




"余計な空白可視化してくれて:FixWhitespaceと打つと全部消してくれる
"https://qiita.com/ahiruman5/items/4f3c845500c172a02935
NeoBundle 'bronson/vim-trailing-whitespace'
" autocmd ファイル保存時に余計な空白を削除する
autocmd BufWritePre * :FixWhitespace

"Load VimFiler
NeoBundle 'Shougo/vimfiler'

NeoBundle "tpope/vim-endwise"
NeoBundle 'slim-template/vim-slim'
" Edit file by tabedit.
let g:vimfiler_edit_action = 'tabopen'
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_safe_mode_by_default = 0
nnoremap <Leader>n :VimFiler -split -simple -winwidth=35 -no-quit<CR>

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'Shougo/vimshell'

"カラースキーマの設定
NeoBundle 'w0ng/vim-hybrid'


" Use vimfiler instead of default filer.
"
" Open filer
" noremap <silent> :tree :VimFiler -split -simple -winwidth=45 -no-quit
" noremap <C-X><C-T> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>
" Don't let <CR> enter the directory but let it open the directory
" autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
" Automatically open vimfiler on start
"autocmd VimEnter * VimFilerExplorer
" If no files are specified, open vimfiler
"autocmd VimEnter * if !argc() | VimFiler | endif


" let g:vimfiler_as_default_explorer = 1
" ↓こんな感じが基本の書き方
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'ekalinin/Dockerfile.vim'

" Unite.vimで最近使ったファイルを表示できるようにする
":Unite file_mru
NeoBundle 'Shougo/neomru.vim'
" vimでgit管理
NeoBundle 'tpope/vim-fugitive'

"カーソル移動すばやく
 NeoBundle 'Lokaltog/vim-easymotion'
 let g:EasyMotion_do_mapping = 0 "Disable default mappings
" nmap s <Plug>(easymotion-s2)

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
"noremap <C-P> :Unite buffer<CR>
" ファイル一覧
"noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
"noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
"noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

source <sfile>:h/vim-module/nerdtree.vim
source <sfile>:h/vim-module/ctrlp.vim
source <sfile>:h//vim-module/buffer.vim

source <sfile>:h/vim-module/git/git.vim

source <sfile>:h/vim-module/rails/rails.vim
source <sfile>:h//vim-module/rails/unite.vim


"The Silver Searcherをvim中で使えるようにする
NeoBundle 'rking/ag.vim'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" コメントON/OFFを手軽に実行(1行=gcc, 複数=shift+v -> gc)
NeoBundle 'tomtom/tcomment_vim'
"自動補完
NeoBundle 'Shougo/neocomplete.vim'

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
      \ }}



" =============================================================
"
" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()


source <sfile>:h/vim-module/indent/indent.vim


" 2018/06/19 HTML 5 tags
syn keyword htmlTagName contained article aside audio bb canvas command
syn keyword htmlTagName contained datalist details dialog embed figure
syn keyword htmlTagName contained header hgroup keygen mark meter nav output
syn keyword htmlTagName contained progress time ruby rt rp section time
syn keyword htmlTagName contained source figcaption
syn keyword htmlArg contained autofocus autocomplete placeholder min max
syn keyword htmlArg contained contenteditable contextmenu draggable hidden
syn keyword htmlArg contained itemprop list sandbox subject spellcheck
syn keyword htmlArg contained novalidate seamless pattern formtarget
syn keyword htmlArg contained formaction formenctype formmethod
syn keyword htmlArg contained sizes scoped async reversed sandbox srcdoc
syn keyword htmlArg contained hidden role
syn match   htmlArg "\<\(aria-[\-a-zA-Z0-9_]\+\)=" contained
syn match   htmlArg contained "\s*data-[-a-zA-Z0-9_]\+"


syntax on
"colorscheme jellybeans
"colorscheme hybrid

"----------------------------------------------------------
" カラースキーム
"----------------------------------------------------------
if neobundle#is_installed('molokai')
    colorscheme molokai " カラースキームにmolokaiを設定する
endif

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける



"F3押すと動的番号生成
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
"nnoremap <F4> :<C-u>set number<CR>
"nnoremap <F5> :<C-u>set nonumber<CR>
" set number
function Setnumber()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
endfunction
nnoremap <silent> <C-m> :call Setnumber()<CR>
"行番号固定
set number

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
"clipboard共有はなんだか失敗
" set clipboard=unnamed,autoselect
" set clipboard=unnamedplus
" set clipboard=autoselect,unnamedplus
" set mouse=a
" clipboardコピーできるようにする(これだけだと成功)
set clipboard=unnamed,autoselect

"#############補完設定###############
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" 補完ウィンドウの設定
set completeopt=menuone

" 補完ウィンドウの設定
set completeopt=menuone

" rsenseでの自動補完機能を有効化
let g:rsenseUseOmniFunc = 1
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" auto-ctagsを使ってファイル保存時にtagsファイルを更新
let g:auto_ctags = 1

" 起動時に有効化
" NeoBundle 'Shougo/neocomplete.vim', '', 'default'
" call neobundle#config('neocomplete.vim', {
"       \ 'lazy' : 1,
"       \ 'autoload' : {
"       \ 'commands' : 'NeoComplateEnable'
"       \ }})
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" 補完の設定
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"######補完設定終わり##############
"https://kadoppe.com/archives/2011/09/vim-html5-highlight-indent-erb.html
"add erb indent 2018/06/19 動いてるのかわからん
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html


"autocmd test 新しいファイル開くとputに指定した文字が入る
"autocmd BufNewFile * put ='ﾋﾞﾑｩ'
"autocmd :NeoCompleteEnable
" command :NeoCompleteEnable
":NeoCompleteEnable

nnoremap <F6> :<C-u>NeoCompleteEnable<CR>

"コロンセミコロン入れ変え shift押さずに:になれる
noremap ; :
noremap : ;

source <sfile>:h/vim-module/tab-kirikae-shortcut.vim


"add 2018/06/19
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1


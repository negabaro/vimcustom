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
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'
"vimproc入れないとunite grepできない。
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
      \ },
      \ }

"Load VimFiler
NeoBundle 'Shougo/vimfiler'

NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}
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

"railsをよりよく使えるように
" NeoBundle 'taichouchou2/vim-rsense'
" NeoBundle 'taichouchou2/vim-rails'
" NeoBundle 'romanvbabenko/rails.vim'

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

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}
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
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
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
filetype plugin indent on
" どうせだから jellybeans カラースキーマを使ってみましょう
set t_Co=256
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

syntax on
"colorscheme jellybeans
colorscheme hybrid 


"タブ周り
" nnoremap ss :<C-u>sp<CR>  "水平分割
" nnoremap sv :<C-u>vs<CR>  "垂直分割
" nnoremap sj <C-w>j
" nnoremap sk <C-w>k
" nnoremap sl <C-w>l
" nnoremap sh <C-w>h
" nnoremap sJ <C-w>J
" nnoremap sK <C-w>K
" nnoremap sL <C-w>L
" nnoremap sH <C-w>H
"
" nnoremap sr <C-w>r

" nnoremap sw <C-w>w


" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" 候補を実行したら新しいタブでファイルを開きたい
"#:Unite file -default-action=tabopen

" unite grepにhw(highway)を使う(速度が速い!)
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif

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

"autocmd test 新しいファイル開くとputに指定した文字が入る
"autocmd BufNewFile * put ='ﾋﾞﾑｩ'
"autocmd :NeoCompleteEnable
" command :NeoCompleteEnable
":NeoCompleteEnable

nnoremap <F6> :<C-u>NeoCompleteEnable<CR>

"NERDTreeを開く
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"vimscript
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "★",
    \ "Staged"    : "☆",
    \ "Untracked" : "*",
    \ "Renamed"   : "*",
    \ "Unmerged"  : "*",
    \ "Deleted"   : "死",
    \ "Dirty"     : "*",
    \ "Clean"     : "^",
    \ 'Ignored'   : '@',
    \ "Unknown"   : "x"
    \ }

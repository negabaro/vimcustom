
"vimgrep shortcut(https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b)
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" Rails 用 vimgrep の除外ディレクトリ
:set wildignore+=log/**,tmp/**,vendor/**,.bundle/**,.git/**,node_modules/**

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

"vimproc入れないとunite grepできない。
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
      \ },
      \ }

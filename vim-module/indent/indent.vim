
"ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" どうせだから jellybeans カラースキーマを使ってみましょう
"set t_Co=256
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する


"言語ごとにインデントの方法を分けたい場合こちらを利用する
"https://easyramble.com/set-vim-indent-with-filetype.html


" space + f するとgg=Gしてくれる。楽
function! s:format_file()
  let view = winsaveview()
  normal gg=G
  silent call winrestview(view)
endfunction
nnoremap <Space>f :call <SID>format_file()<CR>


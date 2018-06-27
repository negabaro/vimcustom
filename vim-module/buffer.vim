" https://original-game.com/vim-airline/
" https://bakyeono.net/post/2015-08-13-vim-tab-madness-translate.html
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

"bufferを利用したタブを有効に
let g:airline#extensions#tabline#enabled = 1

"タブを切り替える
"ctrl + q , ctrl + w
"結構遅いね、、なんか原因があると思うけど、このスピードじゃ使えないね
nmap <C-q> <Plug>AirlineSelectPrevTab

nmap <C-w> <Plug>AirlineSelectNextTab

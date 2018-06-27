" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

"NERDTreeを開く
"nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-e> :NERDTreeTabsToggle<CR>

"Plugin 'mortonfox/nerdtree-ag'

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

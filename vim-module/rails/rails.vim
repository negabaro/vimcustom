"railsをよりよく使えるように
" NeoBundle 'taichouchou2/vim-rsense'
" NeoBundle 'taichouchou2/vim-rails'
" NeoBundle 'romanvbabenko/rails.vim'

" :Rでview -> controller移動できる。戻るのも:Rで戻れる
NeoBundle 'tpope/vim-rails', { 'autoload' : {
      \ 'filetypes' : ['haml', 'ruby', 'eruby'] }}

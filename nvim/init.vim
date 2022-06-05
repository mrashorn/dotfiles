set relativenumber
set nu "row number
set colorcolumn=80
set guicursor= "insert mode block cursor
set hidden "keeps a buffer / window open in background if you change files
set nowrap "the line keeps going off screen
set incsearch "incremental search
set scrolloff=8 "scroll page at bottom 8 lines
set termguicolors



"key maps
"leader key
let mapleader=" "
nnoremap <leader>n :noh<Cr> 


"Plugins
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
call plug#end()





let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

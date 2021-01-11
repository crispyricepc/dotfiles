set number norelativenumber
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin(stdpath("data") . "/plugged")

Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

:colorscheme nord

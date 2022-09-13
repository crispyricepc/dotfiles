call plug#begin(stdpath('data') . '/plugged')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'navarasu/onedark.nvim'
call plug#end()

set number
set tabstop=4
set softtabstop=4
set shiftwidth=0
set expandtab
set autoindent
set smartindent
set clipboard+=unnamedplus

lua << END
require('lualine').setup()
require('nvim-tree').setup()
END

let g:onedark_config = {
  \ 'style': 'dark',
  \ 'transparent': v:true
\ }
colorscheme onedark

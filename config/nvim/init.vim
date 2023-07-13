call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'github/copilot.vim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'mechatroner/rainbow_csv'

Plug 'Mofiqul/vscode.nvim'
call plug#end()

" Source lua
lua require('init')

set number
set tabstop=4
set softtabstop=4
set shiftwidth=0
set expandtab
set autoindent
set smartindent
set clipboard+=unnamedplus
set mouse=a

" Ignorecase shortcut "
nmap <F9> :set ignorecase! ignorecase? <CR>

" coc.nvim configuration
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Make <c-space> trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> <c-`> <cmd>call coc#rpc#request('fillDiagnostics', [bufnr('%')])<CR><cmd>Trouble loclist<CR>

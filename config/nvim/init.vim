call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'github/copilot.vim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

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
set mouse=a

lua << END
require('lualine').setup {
            \ sections = { lualine_a = {'g:coc_status', 'bo:filetype'} }
      \ }
require('nvim-tree').setup()
require('trouble').setup{
    \ position = "bottom",
    \ auto_open = true,
    \ auto_close = true,
    \ height = 10,
    \ mode = "loclist"
  \ }
END

" Small edit to onedark colour scheme to have less bright highlights
autocmd ColorScheme * hi CocMenuSel ctermbg=237 guibg=#13354A

let g:onedark_config = {
  \ 'style': 'dark',
  \ 'transparent': v:true
\ }
colorscheme onedark

" coc.nvim configuration

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Make <c-space> trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> <c-`> <cmd>call coc#rpc#request('fillDiagnostics', [bufnr('%')])<CR><cmd>Trouble loclist<CR>

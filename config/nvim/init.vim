call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'gruvbox-community/gruvbox'

Plug 'vim-airline/vim-airline'

call plug#end()

colorscheme gruvbox 

set noshowmode

set background=dark

set relativenumber

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" File especific formating styles

inoremap jk <esc>
tnoremap jk <c-\><c-n>

noremap <space> <c-w>W
noremap <c-a> :vsplit<cr>

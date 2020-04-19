call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'preservim/nerdtree'

call plug#end()

let g:lightline = { 'colorscheme': 'wombat' }

set noshowmode

set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

inoremap jk <esc>

map <F3> :NERDTreeToggle<cr>

noremap <space> <c-w>W
noremap <c-a> :vsplit<cr>

noremap tn    :tabnew<cr>
noremap <c-j> :tabnext<cr>
noremap <c-k> :tabprev<cr>






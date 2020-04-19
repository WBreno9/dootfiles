call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

call plug#end()

let g:lightline = { 'colorscheme': 'wombat' }

inoremap jk <esc>

noremap <F2> :NERDTreetoggle<cr>

noremap <space> <c-w>W
noremap <c-a> :vsplit<cr>

noremap tn :tabnew<cr>
noremap <c-j> :tabnext<cr>
noremap <c-k> :tabprev<cr>

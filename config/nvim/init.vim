call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'preservim/nerdtree'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set noshowmode

let g:lightline = { 'colorscheme': 'wombat' }

set autoindent
set smartindent
set tabstop=8

" File especific formating styles
augroup c_formating
  autocmd Filetype c :setlocal tabstop=4 
augroup END

augroup js_formating
  autocmd Filetype javascript :setlocal tabstop=2
  autocmd Filetype javascript :setlocal shiftwidth=2
  autocmd Filetype javascript :setlocal expandtab!
augroup END

inoremap jk <esc>

noremap <F2> :NERDTreeToggle<cr>

noremap <space> <c-w>W
noremap <c-a> :vsplit<cr>

noremap tn    :tabnew<cr>
noremap <c-j> :tabnext<cr>


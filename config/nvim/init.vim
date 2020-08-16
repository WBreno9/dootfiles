""""""""""""""""""""""
" LEARNING keymap!!! "
""""""""""""""""""""""

    noremap h <nop>
    noremap l <nop>

""""""""""""""""""""""
" LEARNING keymap!!! "
""""""""""""""""""""""

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'ludovicchabant/vim-gutentags'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'dylanaraps/wal.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'nanotech/jellybeans.vim'

Plug 'elixir-editors/vim-elixir'
Plug 'rust-lang/rust.vim'

call plug#end()

colorscheme gruvbox 

filetype on

set guicursor=

set noshowmode
set relativenumber

set textwidth=80
set nowrap

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set smartcase
set incsearch
set hlsearch!

set noswapfile
set nobackup
set nowritebackup
set undodir="~/.vim/undodir"
set undofile
set hidden

set colorcolumn=80
highlight ColorColumn ctermbg=lightgray guibg=lightgray
set background=dark

let g:netrw_banner=0

let mapleader=" "

inoremap jk <esc>
vnoremap <bs> <esc>
tnoremap jk <c-\><c-n>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>es :source $MYVIMRC<cr>

nnoremap <leader>sh :vsplit<bar> :wincmd L<bar> :vertical resize 80<bar> :term<cr>
nnoremap <leader>ex :Ex<cr>

noremap <c-j> :wincmd j<cr>
noremap <c-k> :wincmd k<cr>
noremap <c-l> :wincmd l<cr>
noremap <c-h> :wincmd h<cr>

noremap <leader>v :vsplit<cr>
noremap <leader>h :split<cr>

noremap <leader>f :Files<cr>
noremap <leader>g :GFiles<cr>
noremap <leader>s :Snippets<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>t :BTags<cr>
noremap <leader>c :Commits<cr>

noremap <leader>w :w<cr>
noremap <leader>q :q<cr>

nmap <silent> <leader>df <Plug>(coc-definition)
nmap <silent> <leader>rf <Plug>(coc-references)
nmap <silent> <leader>rr <Plug>(coc-rename)

augroup vertical_split
    autocmd!
    autocmd FileType help,fugitive wincmd L
augroup END

" File especific formating styles
augroup c_options
  autocmd FileType c,make,sh setlocal tabstop=8
  autocmd FileType c,make,sh setlocal shiftwidth=8
  autocmd FileType c,make,sh setlocal noexpandtab
augroup END

augroup rust_options
  autocmd FileType rust noremap <buffer> <F5> :!cargo run <cr>
  autocmd FileType rust noremap <buffer> <F6> :!cargo build <cr>
augroup END

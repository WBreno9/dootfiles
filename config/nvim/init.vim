call plug#begin(stdpath('data') . '/plugged')

" Plug 'ludovicchabant/vim-gutentags'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'rafi/awesome-vim-colorschemes'
Plug 'dracula/vim'
Plug 'ajgrf/parchment'

Plug 'neovimhaskell/haskell-vim'

call plug#end()

syntax enable
set termguicolors

colorscheme sonokai 
set bg=dark

filetype plugin on

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy = ['exact', 'substring', 'fuzzy']

:lua << END
    require'nvim_lsp'.tsserver.setup{
        on_attach=require'completion'.on_attach
    }
    require'nvim_lsp'.vimls.setup{
        on_attach=require'completion'.on_attach
    }
    require'nvim_lsp'.html.setup{
        on_attach=require'completion'.on_attach
    }
    require'nvim_lsp'.gopls.setup{
        on_attach=require'completion'.on_attach
    }
    require'nvim_lsp'.jedi_language_server.setup{
        on_attach=require'completion'.on_attach
    }
    require'nvim_lsp'.rust_analyzer.setup{
        on_attach=require'completion'.on_attach
    }
    require'nvim_lsp'.hls.setup{
        on_attach=require'completion'.on_attach
    }
END

set nocompatible

set path+=**
set wildmenu
set wildignore=**/node_modules/**

set guicursor=

set relativenumber
set number

set textwidth=80
set nowrap

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set ignorecase
set smartcase
set incsearch
set hlsearch!

set noswapfile
set nobackup
set nowritebackup
set undodir="~/.vim/undodir"
set undofile
set hidden


let mapleader=" "

inoremap jk <esc>
vnoremap <bs> <esc>
tnoremap jk <c-\><c-n>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>es :source $MYVIMRC<cr>

nnoremap <leader>sh :rightb vs +term res 80<cr>
nnoremap <leader>ex :Ex<cr>

let g:tree_toggle=0
let g:tree_winnr=0
let g:tree_last=0

function! ToggleTree()
    if g:tree_toggle
        let g:tree_toggle = 0
        exe g:tree_winnr . "wincmd w"
        au!
        quit
        exe g:tree_last . "wincmd w"
    else
        let g:tree_last = winnr()

        vs 
        wincmd H 
        vertical res 40
        Explore

        let g:tree_winnr = winnr()
        let g:tree_toggle = 1

        exe g:tree_winnr . "wincmd w"
        au QuitPre <buffer> let g:tree_toggle=0
    endif
endfunction

let g:netrw_liststyle=3
" let g:netrw_banner=0
" let g:netrw_browse_split=4

nnoremap <leader>et :call ToggleTree()<cr>

noremap <c-j> :wincmd j<cr>
noremap <c-k> :wincmd k<cr>
noremap <c-l> :wincmd l<cr>
noremap <c-h> :wincmd h<cr>

noremap <leader>i :wincmd K<cr>
noremap <leader>o :wincmd H<cr>

noremap <leader>v :vsplit<cr>
noremap <leader>h :split<cr>

noremap <leader>f :Files<cr>
noremap <leader>g :GFiles<cr>
noremap <leader>r :Rg<cr>
noremap <leader>s :Snippets<cr>
noremap <leader>c :Commits<cr>
noremap <leader>t :BTags<cr>

noremap <leader>w :w<cr>

augroup vertical_split
    autocmd!
    autocmd FileType help wincmd L
augroup END

" Filetype especific formating styles
augroup c_options
  autocmd FileType c,make setlocal noexpandtab
augroup END

augroup rust_options
  autocmd FileType rust noremap <buffer> <F5> :!cargo run <cr>
  autocmd FileType rust noremap <buffer> <F6> :!cargo build <cr>
  autocmd FileType rust noremap <buffer> <F4> :!rustfmt %<cr>
augroup END


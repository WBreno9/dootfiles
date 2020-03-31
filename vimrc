set encoding=utf-8
set nocompatible
filetype off

filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')

Plugin 'dylanaraps/wal.vim'

Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'majutsushi/tagbar'

Plugin 'godlygeek/tabular'

Plugin 'sheerun/vim-polyglot'

if $VIM_LIGHTWEIGHT != "ON"
	Plugin 'dense-analysis/ale'
	Plugin 'ctrlpvim/ctrlp.vim'
endif

call vundle#end()

colorscheme wal

syntax on
 
let g:airline_theme='serene'

map <F3> :Tagbar<cr>
map <F2> :NERDTreeToggle<cr>
noremap <leader>y "*y
noremap <leader>p "+p

noremap <space> <c-w>W

noremap tn :tabnew<cr>
noremap ti :tabprevious<cr>
noremap to :tabnext<cr>

noremap <c-a> :vsplit<cr>
noremap <c-i> :split<cr>

nnoremap <c-h> :tabnew<cr>
nnoremap <c-j> :tabnext<cr>
nnoremap <c-k> :tabprevious<cr>

inoremap jk <esc>
inoremap <esc> <nop>

autocmd BufWritePost *.tex :!pdftex % && pkill -HUP mupdf && mupdf %
autocmd BufWritePost *.latex :!pdflatex % && pkill -HUP mupdf && mupdf %

set nowrap
set completeopt-=preview

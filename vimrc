set encoding=utf-8
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')

Plugin 'dylanaraps/wal.vim'

Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'scrooloose/nerdcommenter'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plugin 'lervag/vimtex'

Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

colorscheme wal

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline_theme='serene'

map <F2> :NERDTreeToggle<cr>
noremap <leader>y "*y
noremap <leader>p "+p

noremap <space> <c-w>W

noremap tn :tabnew<cr>
noremap ti :tabprevious<cr>
noremap to :tabnext<cr>

"noremap bn :bnew<cr>
"nnoremap bi :bprevious<cr>
"nnoremap bo :bnext<cr>
"nnoremap <tab> :bnext<cr>

noremap <c-a> :vsplit<cr>
noremap <c-i> :split<cr>

nnoremap tb :tabnew<cr>
nnoremap th :tabnext<cr>
nnoremap tl :tabprevious<cr>

inoremap jk <esc>
inoremap <esc> <nop>

function SetCMapping()
	echom "Setting C/C++ make mappings"
	noremap <F5> :!make<cr>
	noremap <F6> :!make run<cr>
	noremap <F9> :!make clean<cr>
	setlocal foldmethod=syntax
endfunction
autocmd FileType c   :call SetCMapping()
autocmd FileType cpp :call SetCMapping()

function SetRustMapping()
	echom "Setting Rust make mappings"
	noremap <F5> :!cargo build<cr>
	noremap <F6> :!cargo run<cr>
	noremap <F9> :!cargo clean<cr>
	setlocal foldmethod=syntax
endfunction
autocmd FileType rust :call SetRustMapping()

autocmd BufWritePre *.tex :!pdftex %
autocmd BufWritePre *.latex :!pdflatex %

set nowrap
" set completeopt-=preview

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'vim-syntastic/syntastic'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dylanaraps/wal.vim'

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/deoplete-clangx'
Plug 'sebastianmarkow/deoplete-rust'
" Plug 'racer-rust/vim-racer'

" Plug 'valloric/youcompleteme'

" Plug 'yggdroot/indentline'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

colorscheme wal

let g:deoplete#sources#rust#rust_source_path='/home/wbreno/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:deoplete#sources#rust#racer_binary='/home/wbreno/.cargo/bin/racer'


"let g:airline_powerline_fonts = 1

if has("nvim")
	let g:deoplete#enable_at_startup = 1
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:airline_theme='serene'

"let mapleader=<BS>

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

set nowrap
" set completeopt-=preview

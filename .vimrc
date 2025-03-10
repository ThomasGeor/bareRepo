set nocompatible
filetype on
syntax on
set number
set cursorline

set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=100
set backspace=indent,eol,start "
set nobackup
set nowrap
set incsearch
set ignorecase
set showmatch
set hlsearch
set wildmenu
set vb t_vb=

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ row:\%l\ col:\%c\ percent:\%p%%
set laststatus=2

let g:codedark_modern=1
colorscheme codedark

inoremap jj <esc>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <silent> <Cr> :let @/= '\<' . expand('<cword>') . '\>'<bar>set hls <Cr>

let @L='yyp<C->a'



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

inoremap jj <esc>

let g:codedark_modern=1
colorscheme codedark

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ row:\%l\ col:\%c\ percent:\%p%%
set laststatus=2

nnoremap <silent> <Cr> :let @/= '\<' . expand('<cword>') . '\>'<bar>set hls <Cr>

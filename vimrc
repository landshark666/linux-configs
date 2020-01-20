set nocompatible

filetype off
syntax on
filetype plugin indent on

set nu
"set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
"set guifont=DejaVu\ Sans\ Mono 10

" disable first line of file parsing (-*- etc)
set modelines=0

set ruler

" visual notifications
set visualbell
set encoding=utf-8
set formatoptions=tcqrn1
set backspace=indent,eol,start

" Moving between pairs with %
set matchpairs+=<:>

" Allow hidden buffers
set hidden

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Terminal color scheme
colorscheme darkblue
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" Gui options (remove toolbar)
set guioptions-=T
set guifont=DejaVu\ Sans\ Mono\ 10


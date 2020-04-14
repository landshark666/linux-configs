" Don't forget to call :PlugInstall the first time
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'

" AsyncComplete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'mattn/vim-lsp-settings'

" Colors!
Plug 'flazz/vim-colorschemes'
Plug 'relastle/bluewery.vim'
call plug#end()

set nocompatible

filetype off
syntax on
filetype plugin indent on

set nu
"set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set ruler
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set visualbell
set encoding=utf-8
set formatoptions=tcqrn1
set backspace=indent,eol,start

" disable first line of file parsing (-*- etc)
" set modelines=0

" Moving between pairs with %
set matchpairs+=<:>

" Reload/edit vimrc
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Terminal color scheme
colorscheme darkblue
" colorscheme bluewery

" Nice light bg scheme
" colorscheme grape
set t_Co=256
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1

" Gui options (remove toolbar)
set guioptions-=T
set guifont=Noto\ Mono\ 10
" set guifont=DejaVu\ Sans\ Mono\ 10

" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif

highlight Pmenu guibg=darkgray guifg=black


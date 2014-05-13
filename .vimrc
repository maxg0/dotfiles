" Vim not vi settings
set nocompatible
scriptencoding utf-8
set encoding=utf-8

"set mouse=a

set backspace=indent,eol,start
syntax on
"set number
set visualbell
set autoread

set ruler

set noswapfile
set nobackup
set nowb

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" hides unwanted spaces with a · symbol
" needs `scriptencoding utf-8` and `set encoding=utf-8`
set list listchars=tab:\ \ ,trail:·

set linebreak

set foldmethod=indent
set foldnestmax=3
set nofoldenable " folding hides functions etc

set completeopt=longest,menuone


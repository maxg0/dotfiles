" Vim not vi settings
set nocompatible
scriptencoding utf-8
set encoding=utf-8

set title

"set mouse=a
execute pathogen#infect()

set background=dark
colorscheme desert
set t_Co=256


syntax on
filetype plugin indent on

set cursorline
" http://stackoverflow.com/a/23191007
hi CursorLine cterm=NONE ctermbg=234 guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=234 guibg=darkred guifg=white
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
"nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

" Horizontally expanded list when autocompleting, try :<Tab> and :<S-Tab>
set wildmenu

set backspace=indent,eol,start
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

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" hides unwanted spaces with a · symbol
" needs `scriptencoding utf-8` and `set encoding=utf-8`
set list listchars=tab:\ \ ,trail:·

set linebreak

set foldmethod=indent
set foldnestmax=3
set nofoldenable " folding hides functions etc

set completeopt=longest,menuone


" IDE like omnicompletion: http://vim.wikia.com/wiki/VimTip1386
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

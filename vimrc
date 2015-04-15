" Vim not vi settings
set nocompatible
scriptencoding utf-8
set encoding=utf-8

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'othree/html5.vim'
Plugin 'jshint.vim'
Plugin 'surround.vim'
Plugin 'editorconfig-vim'

call vundle#end()
filetype plugin indent on
" End Vundle

set title

set mouse=""

command! Reload so $MYVIMRC

" Auto reloads vim | source http://stackoverflow.com/a/2403926/2324209
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set background=dark
colorscheme ron
set t_Co=256

" Highlight 81st and 121st characters on a line
set colorcolumn=81
"set colorcolumn=121

syntax on
filetype plugin indent on

set cursorline
" http://stackoverflow.com/a/23191007
hi CursorLine cterm=NONE ctermbg=234
hi CursorColumn cterm=NONE ctermbg=234
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
" set incsearch

" hides unwanted spaces with a · symbol
" needs `scriptencoding utf-8` and `set encoding=utf-8`
set list listchars=tab:\ \ ,trail:·

set linebreak

set foldmethod=indent
set foldnestmax=3
set nofoldenable " folding hides functions etc

set completeopt=longest,menuone

" Swap between .h and .cpp files with F4
" http://vim.wikia.com/wiki/Easily_switch_between_source_and_header_file
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Run current buffer with python
" http://stackoverflow.com/a/18948530/2324209
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

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

autocmd FileType * setlocal formatoptions+=c formatoptions+=r formatoptions+=o

" Remember cursor position
" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Remember undo/changes history
" http://askubuntu.com/a/4247/194406
set undofile
set undodir=~/.vimundo/


" Vim not vi settings
set nocompatible
scriptencoding utf-8
set encoding=utf-8
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'lepture/vim-jinja'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'jshint.vim'
Plugin 'surround.vim'
Plugin 'editorconfig-vim'

Plugin 'mbbill/undotree'
" these are from
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

call vundle#end()
filetype plugin indent on
" End Vundle

let g:syntastic_python_checkers = ['pylint', 'flake8']

" Undotree toggle with U
nnoremap U :UndotreeToggle<cr>

" Paste toggle, because indentation messes up pasted code like this:
" function pasted() {
"         var i = 0;
"                 if(i === 3) {
"                             ...
" so instead you :set paste and :set nopaste, but those take a lot of typing
" so use the F12 key for this instead. There are more complicated solutions
" but this works for now. (could for instance use Shift+Insert to jump to
" paste mode, paste the text and turn paste mode off)
set pastetoggle=<F12>

vmap <F6> :w !xclip<CR><CR>

" Show statusline
set laststatus=2

" Powerline stuff
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set showtabline=2
set t_Co=256
set noshowmode
" end of powerline stuff

set title

set mouse=

command! Reload so $MYVIMRC

" Auto reloads vim | source http://stackoverflow.com/a/2403926/2324209
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set background=dark
colorscheme ron
set t_Co=256

" To enforce 80 line limits, highlight 81st (and optionally 121st) characters
" on a line
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

" set spaces to 2 in yaml files
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
" set incsearch

" marks trailing spaces with a · symbol
" needs `scriptencoding utf-8` and `set encoding=utf-8`
set list listchars=tab:▸-,trail:·

set linebreak

set foldmethod=indent
set foldnestmax=3
set nofoldenable " folding hides functions etc

set completeopt=longest,menuone

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Swap between .h and .cpp files with F4
" http://vim.wikia.com/wiki/Easily_switch_between_source_and_header_file
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"Remove all trailing whitespace by pressing F5
"http://vi.stackexchange.com/a/2285
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Ctrl+B and Shift+B change buffers
nnoremap gn :bnext<CR>
nnoremap gb :bprevious<CR>

" Navigate windows with Ctrl+HJKL
nnoremap <C-H> :wincmd h<CR>
nnoremap <C-I> :wincmd i<CR>
nnoremap <C-J> :wincmd j<CR>
nnoremap <C-K> :wincmd k<CR>

" Move tabs with Ctrl+] and Ctrl+[
nnoremap <C-N> :tabm +1<CR>
nnoremap <C-B> :tabm -1<CR>

nnoremap <C-C> :tabnew 

" navigate tabs with Esc+H and Esc+L
noremap <S-L> :tabnext<CR>
noremap <S-H> :tabprevious<CR>

nnoremap <S-K> <Nop>

" Run current buffer with python
" http://stackoverflow.com/a/18948530/2324209
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

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

autocmd FileType tex noremap j gj
autocmd FileType tex noremap k gk
autocmd FileType tex set colorcolumn=0

hi clear SpellBad
hi SpellBad ctermfg=244

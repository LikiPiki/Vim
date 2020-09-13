" --- Basic setup ---
set cursorline

set number
set relativenumber
set colorcolumn=80

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set encoding=utf8
set noet
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

noremap <Down> <C-W>j
noremap <Up> <C-W>k
noremap <Left> <C-W>h
noremap <Right> <C-W>l>

set inccommand=nosplit
set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf8,cp1251
set nocompatible
set diffopt+=vertical
set laststatus=2
set encoding=utf8

"--- Code folding ---
set foldmethod=indent
set foldlevel=3

" autocmd BufWinLeave *.* mkview 
" autocmd BufWinEnter *.* silent loadview

" show first row for ALE
set signcolumn=yes

" --- LANG MAP ---
" imap оо <Esc>
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ№;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>#
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

syntax on

" tabs setting
autocmd Filetype css setlocal tabstop=2
autocmd Filetype html setlocal tabstop=2
autocmd Filetype htmldjango setlocal tabstop=2

set mouse=a

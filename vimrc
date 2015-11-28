filetype on                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim" call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
 Plugin 'tpope/vim-fugitive'
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'tpope/vim-surround'
 Plugin 'scrooloose/nerdtree'
 Plugin 'haya14busa/incsearch.vim'
 Plugin 'kien/ctrlp.vim'
 Plugin 'vim-scripts/vim-auto-save'
 Plugin 'Lokaltog/vim-powerline'
 Plugin 'Shougo/neocomplcache.vim'
 Plugin 'thinca/vim-quickrun'
 Plugin 'easymotion/vim-easymotion'
 Plugin 'nanotech/jellybeans.vim'
 Plugin 'scrooloose/syntastic'
 Plugin 'MarcWeber/vim-addon-mw-utils'
 Plugin 'tomtom/tlib_vim'
 Plugin 'garbas/vim-snipmate'
 " " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
 Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
 Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
 call vundle#end()            " required
" filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"Colorscheme set up
syntax enable
" set background=dark
" colorscheme solarized

color jellybeans

"Nerdtree set up
map <C-n> :NERDTreeToggle<CR>

imap df <esc>

set number

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

"tmux navigation
let g:tmux_navigator_no_mappings = 1

" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)))
"CntrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Synstasic settings
let g:syntastic_enable_signs=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
map <C-b>sc :SyntasticCheck<CR>
let g:neocomplcache_enable_at_startup = 1
set mouse=a
"use this if you need a autocomplete ore C-n
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"snipmate
"maps
map <C-t> :tabnew <CR>
map <C-r> :QuickRun <CR>
map <C-e> :tabclose<CR>

map <D-s> :w <CR>
map <D-w> :!q<CR>

"Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"snipmate
set nocompatible
filetype on
filetype plugin on
imap <C-k> <Plug>snipMateNextOrTrigger


set t_Co=256

set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
set nocompatible

"autosave plugin
let g:auto_save = 1 
let g:auto_save_no_updatetime = 30
let g:auto_save_in_insert_mode = 0



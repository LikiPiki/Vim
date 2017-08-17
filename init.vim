" This .vimrc by Saby use Vim-Plug -> github.com/junegunn/vim-plug
" 1. Install Vim - Plug -> curl -fL
" ~/.vim/autoload/plug.vim --create-dirs \
" 	https://raw.githubusercjntent.com/junegunn/vim-plug/master/plug.vim
" 2. Copy this .vimrc to your .vimrc
" 3. Go to vim and :PlugInstall

" --- Vim-Plug BEGIN
"
call plug#begin('~/.vim/plugged')

" --- KeyMap ---
map <C-n> :NERDTreeToggle<CR>
map <C-p> :CtrlPBuffer<CR>

imap df <esc>
let mapleader=" "
map <space> :
noremap ; :
map <leader>; :
map <leader>fs :w<CR>

inoremap <expr><C-h>  neocomplcache#close_popup()

map <F6> :Gist<CR>
map <F7> :AirlineToggleWhitespace<CR>
nmap <F8> :TagbarToggle<CR>

" --- Language support --- 
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'valloric/MatchTagAlways', { 'for': 'html' }
Plug 'elixir-lang/vim-elixir'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
Plug 'pangloss/vim-javascript', { 'for' : 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

" --- Tools Plugins ---
Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line=1

Plug 'easymotion/vim-easymotion'
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)

Plug 'vim-scripts/tComment'
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plug 'majutsushi/tagbar'
" ----- Editing code plugins ----
" -- Snippets and autocomplete --

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'LikiPiki/Snips'
Plug 'honza/vim-snippets'
map <leader>u :NeoSnippetEdit -split -vertical<CR>
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['python'] = 'python,django'

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets, ~/.vim/plugged/Snips/NeoSnippets'

" --- Autocomplete ---
Plug 'Shougo/deoplete.nvim'
set completeopt-=preview
let g:deoplete#enable_at_startup = 1


" NEOMAKE
Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake

" --- Color Themes ---
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" --- AIRLINE ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
let g:deoplete#enable_at_startup = 1


" --- Basic setup ---
set cursorline

set number
set colorcolumn=80

set tabstop=4
set shiftwidth=4
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

set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
set nocompatible
set laststatus=2
set encoding=utf8

" --- Vim-Plug END ---
call plug#end()

syntax on
set background=dark
color gruvbox

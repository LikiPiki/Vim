" This .vimrc by Saby use Vim-Plug -> github.com/junegunn/vim-plug
" 1. Install Vim - Plug -> curl -fL
" ~/.vim/autoload/plug.vim --create-dirs \
" 	https://raw.githubusercjntent.com/junegunn/vim-plug/master/plug.vim
" 2. Copy this .vimrc to your .vimrc
" 3. Go to vim and :PlugInstall
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'kien/tabman.vim'
Plug 'mhinz/vim-grepper'

"WhiteSpace
" Plug 'bronson/vim-trailing-whitespace'

Plug 'vim-ctrlspace/vim-ctrlspace'
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
set hidden
map <C-x> :CtrlSpace<CR>
Plug 'szw/vim-maximizer'
" set showtabline=0
Plug 'L9'
" Plug 'wincent/command-t', {
" \   'do': 'rake make'
" \ }
" Plug 'minibufexpl.vim'
" let g:airline#extensions#tabline#enabled = 1

" Airline tabs settings
" let g:airline#extensions#tabline#fnamemod = ':t'
Plug 'wincent/scalpel'
" set listchars=tab:\|\ 
set list

" Plug 'wincent/terminus'
" let g:TerminusInsertCursorShape=0

map <C-n> :NERDTreeToggle<CR>

imap df <esc>
let mapleader=" "
map <space> :
noremap ; :
map <leader>; :
" map <leader>n :NERDTreeToggle<CR>
map <leader>s :Gstatus<CR>
map <leader>c :Gcommit<CR>
" map <leader>u :UltiSnipsEdit<CR>
map <leader>u :NeoSnippetEdit -split -vertical<CR>
map <leader>fs :w<CR>
map <leader>js :CtrlPCdnJs<CR>
map <leader>o :CtrlPBuffer<CR>
map <leader>h :MBEToggle<CR>
map <leader>g :Grepper<CR>
map <leader>w :FixWhitespace<CR>
map <leader>m :MaximizerToggle<CR>
map <leader>l :lopen<CR>
map <leader>n :lnext<CR>

imap <C-j> <C-n>
imap <C-k> <C-p>
map <C-p> :CtrlPBuffer<CR>

vmap <leader>t :Tabularize /

" map <C-x>2 :sp<CR>
" map <C-x>3 :vsp<CR>

map <F5> :SyntasticToggleMode<CR>
map <F6> :Gist<CR>
map <F7> :AirlineToggleWhitespace<CR>
map <F9> :set list!<CR>

" set invlist
" set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
" set showbreak=↪

" Tab control
set completeopt+=longest

noremap <Down> <C-W>j
noremap <Up> <C-W>k
noremap <Left> <C-W>h
noremap <Right> <C-W>l>

set number
set colorcolumn=80

set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set encoding=utf8
set noet

"coloshemes
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/Sorcerer'
Plug 'altercation/vim-colors-solarized'
Plug 'jdkanani/vim-material-theme'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'szw/seoul256.vim'
Plug 'vim-scripts/Lucius'
" NEOVIM themes
Plug 'mhartington/oceanic-next'
set background=dark
" color solarized
" let g:seoul256_background = 235
" let g:airline_theme='base16'
" let g:airline#extensions#tabline#enabled = 1
" let g:gruvbox_contrast_dark='medium'

"Plug 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'fancy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
let g:airline_powerline_fonts = 1
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1                                                                    
" CTRLSPACE
let g:airline_exclude_preview = 1
let g:CtrlSpaceUseTabline = 1 
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
set laststatus=2
set encoding=utf8

" Track the engine.
" Plug 'SirVer/ultisnips'
inoremap <expr><C-h>  neocomplcache#close_popup()
" Snippets are separated from the engine. Snippets for ultisnips
Plug 'chrisgillis/vim-bootstrap3-snippets'

imap <s-tab> <c-p>

" NEOSNIPPETS
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'LikiPiki/Snips'
Plug 'honza/vim-snippets'

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['python'] = 'python,django'

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets, ~/.vim/plugged/Snips/NeoSnippets'
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-k>"
" let g:UltiSnipsJumpForwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-l>"
" let g:UltiSnipsListSnippets = "<c-l>"
" let g:UltiSnipsSnippetsDir = "~/.vim/plugged/Snips/UltiSnips"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-vim'
let g:deoplete#enable_at_startup = 1
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<c-k>"

Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-markdown', { 'for':  'markdown'}
" Plug 'godlygeek/tabular'
Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line=1
Plug 'szw/vim-tags'

Plug 'tpope/vim-surround'
" Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake
" Warnings ignore

Plug 'vim-scripts/tComment'
Plug 'tpope/vim-repeat'
" Plug 'aperezdc/vim-template'
Plug 'pangloss/vim-javascript', {'for' : 'javascript'}

Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plug 'ctrlpvim/ctrlp.vim'

" Plug 'ervandew/supertab'

"tmux
Plug 'edkolev/tmuxline.vim'

"Python
" Plug 'klen/python-mode', {'for' : 'python'}
Plug 'davidhalter/jedi-vim'

"Web development
Plug 'tmhedberg/matchit'
Plug 'itspriddle/vim-jquery', {'for' : 'javascript'}
" Plug 'pasela/ctrlp-cdnjs', {'for' : 'javascript'}
Plug 'kchmck/vim-coffee-script'
" Plug 'flazz/vim-colorschemes'
" Plug 'rstacruz/sparkup'
Plug 'valloric/MatchTagAlways', { 'for': 'html' }
Plug 'mattn/emmet-vim'
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif
" return a regular tab character
  return "\<tab>"
  endfunction
autocmd FileType html,markdown imap <buffer><expr><tab> <sid>expand_html_tab()
let g:user_emmet_mode='a'
let g:user_emmet_complete_tag = 0
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" for c++ development
" Plug 'vim-scripts/c.vim'
Plug 'Raimondi/delimitMate'
" Folding
" Plug 'Konfekt/FastFold'

" Plug 'mbbill/undotree'
" Plug 'majutsushi/tagbar'

" nmap <F8> :TagbarToggle<CR>

let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

set mouse=a
"maps
map <C-t> :tabnew <CR>
map <C-r> :QuickRun <CR>
" map <C-e> :tabclose<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

Plug 'easymotion/vim-easymotion'

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" Move to line
" map <Leader>l <Plug>(easymotion-bd-jk)
" nmap <Leader>l <Plug>(easymotion-overwin-line)
"
" " Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

set backspace=indent,eol,start
set backspace=2  "compatible with version 5.4 and earlier

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

set t_Co=256

set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
set nocompatible

"tabs settings
map <f3> :zM<CR>
map <f4> :zR<CR>
map [ gT<CR>
map ] gt<CR>

" Add plugins to &runtimepath
call plug#end()

syntax on

color gruvbox

"  init.vim by LikiPiki use Vim-Plug -> github.com/junegunn/vim-plug
"
" --- Vim-Plug BEGIN
"
call plug#begin('~/.vim/plugged')

" --- KeyMap ---
let mapleader=","
let maplocalleader = " "
	
map <C-n> :NERDTreeToggle<CR>

" dont show status
set noshowmode

imap df <esc>
noremap ; :
map <leader>fs :terminal<CR>
tnoremap <Esc> <C-\><C-n>:q!<CR>

inoremap <expr><C-h>  neocomplcache#close_popup()
map <C-n> :NERDTreeToggle<CR>

map <F6> :Gist<CR>
map <F7> :AirlineToggleWhitespace<CR>
nmap <F8> :TagbarToggle<CR>

set termguicolors

" testing wakatime	
Plug 'wakatime/vim-wakatime'
" --- Language support --- 
Plug 'valloric/MatchTagAlways', { 'for': 'html' }

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
augroup GOlang
    au!
    autocmd FileType go
        \  nmap <buffer> <LocalLeader>r   <Plug>(go-run)
        \| nmap <buffer> <LocalLeader>R   <Plug>(go-rename)
        \| nmap <buffer> <LocalLeader>b   <Plug>(go-build)
        \| nmap <buffer> <LocalLeader>t   <Plug>(go-test)
        \| nmap <buffer> <LocalLeader>c   <Plug>(go-coverage)
        \| nmap <buffer> <LocalLeader>gv  <Plug>(go-doc-vertical)
		\| nmap <buffer> <LocalLeader>gd  <Plug>(go-doc)
        \| nmap <buffer> <LocalLeader>gg  <Plug>(go-def)
        \| nmap <buffer> <LocalLeader>gp  <Plug>(go-def-pop)
        \| nmap <buffer> <LocalLeader>s   <Plug>(go-implements)
        \| nmap <buffer> <LocalLeader>i   <Plug>(go-info)
        \| nmap <buffer> <LocalLeader>I   <Plug>(go-imports)
        \| nmap <buffer> <LocalLeader>l   <Plug>(go-lint)
augroup END

" Javascript plugins
" Plug 'pangloss/vim-javascript', { 'for' : 'javascript' }
" Plug 'mxw/vim-jsx', { 'for': 'javascript' }

"--- Tools Plugins ---
"  git suppert
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' }
let NERDTreeIgnore = ['\.pyc$']

Plug 'tpope/vim-repeat'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_history_dir = '~/.local/share/fzf-history'
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
" --- FZF Keybindings ---
map <C-p> :Files<CR>
" map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
" nnoremap <leader>f :Lines<CR>
nnoremap <leader>c :Commands<CR>


Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
"
Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line=1

Plug 'easymotion/vim-easymotion'
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>f y/\V<C-R>=escape(@",'/\')<CR><CR>

Plug 'AndrewRadev/splitjoin.vim'
"
Plug 'matze/vim-move'
"
Plug 'vim-scripts/tComment'
" Plug 'terryma/vim-multiple-cursors'
" let g:multi_cursor_next_key='<C-d>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

Plug 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

"--- Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit="vertical"

let g:ulti_snippet_expanded = 0
autocmd! User UltiSnipsEnterFirstSnippet
autocmd User UltiSnipsEnterFirstSnippet call UltiSnipsSnippetStart()
autocmd! User UltiSnipsExitLastSnippet
autocmd User UltiSnipsExitLastSnippet call UltiSnipsSnippetEnd()

function! UltiSnipsSnippetStart()
	let g:ulti_snippet_expanded = 1
endfunction

function! UltiSnipsSnippetEnd()
	let g:ulti_snippet_expanded = 0
	echo "Inside snippet"
endfunction

let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Custom completition like SUPERTab (like VSCode snippets works)
function! g:UltiSnips_Complete()
	if g:ulti_snippet_expanded == 0
		call UltiSnips#ExpandSnippet()
		if g:ulti_expand_res == 0
			if pumvisible()
				return "\<C-n>"
			else
			   return "\<TAB>"
			endif
		endif
	else
		call UltiSnips#JumpForwards()
	endif
	return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

Plug 'honza/vim-snippets'

"--- Autocomplete ---
"Deoplete completition {{{
	" Plug 'Shougo/deoplete.nvim'
	" set completeopt-=preview
	" let g:deoplete#enable_at_startup = 1
"}}}
" Plug 'zchee/deoplete-jedi'

" Coc completition {{{
	source $HOME/.config/nvim/coc.vim
"}}}

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

"--- Syntax checking ---
Plug 'dense-analysis/ale'
nmap <silent> <A-l> <Plug>(ale_previous_wrap)
nmap <silent> <A-h> <Plug>(ale_next_wrap)

"--- Color Themes ---
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'

" --- AIRLINE ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

let g:airline_powerline_fonts = 0
let g:airline_theme='one'
let g:airline_exclude_preview = 1
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline#extensions#whitespace#enabled = 0
let airline#extensions#ale#show_line_numbers = 0

let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1

set showtabline=2

map <leader>w :AirlineToggleWhitespace<CR>

" --- Default simple configuration ---
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/keys.vim

" --- Vim-Plug END ---
call plug#end()

" You must call deoplete#custom#source() after plug#end().
" Because, plug#end() add plugins runtimepath.
" call deoplete#custom#source('ultisnips', 'rank', 9999)

" Register which key map
call which_key#register(',', "g:which_key_map")

color one


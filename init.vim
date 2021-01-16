"  init.vim by LikiPiki use Vim-Plug -> github.com/junegunn/vim-plug
"
" --- Vim-Plug BEGIN
call plug#begin('~/.vim/plugged')

" --- KeyMap ---
let mapleader=","
let maplocalleader = " "
	
" dont show status
set noshowmode

imap df <esc>
noremap ; :

map <leader>fs :terminal<CR>
tnoremap <ESC> <C-\><C-n><C-w><C-p>

Plug 'mhinz/vim-startify'
let g:startify_bookmarks = [
		\ { 'i': '~/.config/nvim/init.vim' },
		\ { 'n': '~/.config/nvim' },
		\ { 'z': '~/.zshrc' },
		\ ]

set termguicolors

map <A-h> :bp<CR>
map <A-l> :bn<CR>
map <A-d> :bd<CR>


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

" Plug 'sheerun/vim-polyglot'

"--- Tools Plugins ---
"  git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'
Plug 'junegunn/goyo.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

let g:fzf_history_dir = '~/.local/share/fzf-history'
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" FZF Delete buffers
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" --- FZF Keybindings ---
map <C-p> :Files<CR>
" map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
" nnoremap <leader>f :Lines<CR>
nnoremap <leader>c :Commands<CR>
nnoremap <leader>B :BD<CR>
nnoremap <C-s> :BLines<CR>

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line=1

Plug 'easymotion/vim-easymotion'
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-s2)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <leader>f y/\V<C-R>=escape(@",'/\')<CR><CR>

set ignorecase
set smartcase

Plug 'vim-scripts/tComment'

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

" Custom completition (like VSCode snippets works)
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

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<CR>"

Plug 'honza/vim-snippets'

" Install nightly neovim plugins, or use COC for autocomplete
if has('nvim-0.5')
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" Neovim lua file manager
	Plug 'kyazdani42/nvim-tree.lua'
	let g:nvim_tree_show_icons = {
		\ 'git': 1,
		\ 'folders': 0,
		\ 'files': 0,
		\ }
	let g:nvim_tree_bindings = {
    \ 'edit': ['<CR>', 'l'],
	\ 'close_node': ['<S-CR>', 'h'],
	\ }
	nnoremap <C-n> :NvimTreeToggle<CR>

	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
	Plug 'steelsojka/completion-buffers'
	let g:completion_trigger_keyword_length = 3
	let g:completion_enable_snippet = 'UltiSnips'
	let g:completion_trigger_on_delete = 0
	let g:completion_auto_change_source = 1
	let g:completion_timer_cycle = 90 "default value is 80
	let g:completion_chain_complete_list = [
		\{'complete_items': ['lsp']},
		\{'complete_items': ['buffers']},
		\{'complete_items': ['snippet']},
		\{'mode': '<c-p>'},
		\{'mode': '<c-n>'}
	\]
	set completeopt=menuone,noinsert,noselect
	set pumheight=10
	set shortmess+=c
	set complete-=t " disable tags complete
	" Use <Tab> and <S-Tab> to navigate through popup menu
	autocmd BufEnter * lua require'completion'.on_attach()
else
	source $HOME/.config/nvim/coc.vim
endif

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

"--- Color Themes ---
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'rakr/vim-one'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'arcticicestudio/nord-vim'

" --- LaTeX ---
Plug 'lervag/vimtex'
autocmd Filetype tex setl updatetime=1
let g:vimtex_quickfix_mode=0
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'skim'
map <F1> :set spell spelllang=ru,en<CR>

" -- Lightline --
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0

let g:lightline = {
			\ 'active': {
            \       'left': [ [ 'mode', 'paste' ],
            \               [ 'gitbranch' ],
            \               [ 'spell', 'readonly', 'filetype', 'filename' ]],
            \       'right': [ [ 'percent' ], [ 'lineinfo' ],
            \               [ 'fileformat', 'fileencoding' ],
            \               [ 'cocstatus', 'linter_errors', 'linter_warnings' ]]
            \   },
			\   'component_expand': {
            \   },
			\   'component_function': {
			\       'gitbranch': 'FugitiveHead',
            \       'cocstatus': 'coc#status',
            \       'currentfunction': 'helpers#lightline#currentFunction'
            \   },
            \   'component_type': {
            \       'readonly': 'error',
            \       'linter_warnings': 'warning',
            \       'linter_errors': 'error',
            \       'buffers': 'tabsel'
            \   },
            \   'separator': { 'left': '', 'right': '' },
            \   'subseparator': { 'left': '', 'right': '' }
		\ }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#clickable = 1

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
set showtabline=2

" --- Default simple configuration ---
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/keys.vim

" --- Vim-Plug END ---
call plug#end()

" Register which key map
call which_key#register(',', "g:which_key_map")

" let g:shades_of_purple_lightline = 1
" let g:lightline.colorscheme = 'shades_of_purple'
let g:lightline.colorscheme = 'nord'

color nord

if has('nvim-0.5')
" Treesitter settings
:lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "javascript", "typescript", "toml", "python"},
  highlight = {
	enable = true,
  },
}
EOF

:lua << EOF
   local nvim_lsp = require('lspconfig')
   local servers = {'clangd', 'jsonls', 'html', 'tsserver', 'gopls'}
   local on_attach = function(_, bufnr)
	   require('diagnostic').on_attach()
	   require('completion').on_attach()
	   local opts = { noremap=true, silent=true }
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xd', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
   end
   for _, lsp in ipairs(servers) do
	 nvim_lsp[lsp].setup {
	 }
   end
EOF
endif

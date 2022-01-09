"  init.vim by LikiPiki use Vim-Plug -> github.com/junegunn/vim-plug
"
call plug#begin('~/.vim/plugged')

" --- KeyMap ---
let mapleader=","
let maplocalleader = " "
    
set noshowmode

imap df <esc>
noremap ; :

map <leader>fs :terminal<CR>
tnoremap <ESC> <C-\><C-n><C-w><C-p>

set termguicolors

map <A-h> :bp!<CR>
map <A-l> :bn!<CR>
map <A-d> :bd<CR>

" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go'}
" augroup GOlang
"     au!
"     autocmd FileType go
"         \  nmap <buffer> <LocalLeader>r   <Plug>(go-run)
"         \| nmap <buffer> <LocalLeader>R   <Plug>(go-rename)
"         \| nmap <buffer> <LocalLeader>b   <Plug>(go-build)
"         \| nmap <buffer> <LocalLeader>t   <Plug>(go-test)
"         \| nmap <buffer> <LocalLeader>c   <Plug>(go-coverage)
"         \| nmap <buffer> <LocalLeader>gv  <Plug>(go-doc-vertical)
"         \| nmap <buffer> <LocalLeader>gd  <Plug>(go-doc)
"         \| nmap <buffer> <LocalLeader>gg  <Plug>(go-def)
"         \| nmap <buffer> <LocalLeader>gp  <Plug>(go-def-pop)
"         \| nmap <buffer> <LocalLeader>s   <Plug>(go-implements)
"         \| nmap <buffer> <LocalLeader>i   <Plug>(go-info)
"         \| nmap <buffer> <LocalLeader>I   <Plug>(go-imports)
"         \| nmap <buffer> <LocalLeader>l   <Plug>(go-lint)
" augroup END

"--- Tools Plugins ---
"  git support
Plug 'airblade/vim-gitgutter'
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

" --- FZF Keybindings ---
map <leader>p :Files<CR>
map <C-p> :Files<CR>
" map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>
" nnoremap <leader>f :Lines<CR>
nnoremap <leader>c :Commands<CR>
nnoremap <C-s> :BLines<CR>

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

" Install nightly neovim plugins, or use the COC for autocomplete
if has('nvim-0.5')
    " Neovim lua file manager
    Plug 'kyazdani42/nvim-tree.lua'
    noremap <C-n> :NvimTreeFindFile<CR>
    noremap <leader>n :NvimTreeToggle<CR>

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'neovim/nvim-lspconfig'

    Plug 'hrsh7th/nvim-compe'
    let g:compe = {}
    let g:compe.enabled = v:true
    let g:compe.autocomplete = v:true
    let g:compe.debug = v:false
    let g:compe.min_length = 3
    let g:compe.preselect = 'enable'
    let g:compe.throttle_time = 80
    let g:compe.source_timeout = 200
    let g:compe.incomplete_delay = 400
    let g:compe.max_abbr_width = 100
    let g:compe.max_kind_width = 100
    let g:compe.max_menu_width = 100
    let g:compe.documentation = v:true

    let g:compe.source = {}
    let g:compe.source.path = v:false
    let g:compe.source.buffer = v:true
    let g:compe.source.calc = v:false
    let g:compe.source.nvim_lsp = v:true
    let g:compe.source.nvim_lua = v:false
    let g:compe.source.ultisnips = v:true

    inoremap <silent><expr> <C-Space> compe#complete()
    inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    inoremap <silent><expr> <C-e>     compe#close('<C-e>')
    inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

    set completeopt=menuone,noselect
    set shortmess+=c
endif

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"


noremap <leader>n :e .<CR>

"--- Color Themes ---
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'rakr/vim-one'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'arcticicestudio/nord-vim'

" --- LaTeX ---
" Plug 'lervag/vimtex'
" autocmd Filetype tex setl updatetime=1
" let g:vimtex_quickfix_mode=0
" let g:tex_flavor = "latex"
" let g:vimtex_view_method = 'skim'
" map <F1> :set spell spelllang=ru,en<CR>

" -- Lightline --
Plug 'itchyny/lightline.vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'mengelbrecht/lightline-bufferline'

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0

let g:lightline = {
            \ 'colorscheme': 'base16',
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

let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#clickable = 1

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
set showtabline=2

" --- Default simple configuration ---
source $HOME/.config/nvim/settings.vim
" source $HOME/.config/nvim/keys.vim

" --- Vim-Plug END ---
call plug#end()

color base16-solarized-dark

let g:nvim_tree_icons = {}
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

 if has('nvim-0.5')
     :lua require('treesitter')
     :lua require('lsp')
     :lua require('tree')
 endif

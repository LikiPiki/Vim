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

"--- Tools Plugins ---
"  git support
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/tComment'

" Install nightly neovim plugins
if has('nvim-0.5')
    " Neovim lua file manager
    Plug 'kyazdani42/nvim-tree.lua'
    noremap <C-n> :NvimTreeFindFile<CR>
    noremap <leader>n :NvimTreeToggle<CR>

    Plug 'neovim/nvim-lspconfig'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'

    " For new neovim version
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

    " Find files using Telescope command-line sugar.
    " Using Lua functions
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

    " For vsnip users.
    Plug 'dcampos/cmp-snippy'
    Plug 'dcampos/nvim-snippy'
    Plug 'honza/vim-snippets'

    set completeopt=menu,menuone,noselect
    set shortmess+=c
endif

inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

noremap <leader>n :e .<CR>

"--- Color Themes ---
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

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
     :lua require('cmp-config')
     :lua require('lsp')
     :lua require('tree')
     :lua require('snippets')
 endif

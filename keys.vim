" --- WhichKey configuration ---
Plug 'liuchengxu/vim-which-key'

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}

" Define a separator
let g:which_key_sep = '→'
set timeoutlen=500
let g:mapleader = ","
let g:maplocalleader = ' '

nnoremap <silent> <leader>      :<c-u>WhichKey '<leader>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '<localleader>'<CR>

let g:which_key_use_floating_win = 0
" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" --- Keybindings ---
let g:which_key_map['c'] = [ ':Commands', 'fuzzy-commands']
let g:which_key_map['f'] = [ ':Lines', 'find-in-buffers']
let g:which_key_map['u'] = [ ':UltiSnipsEdit', 'edit-ultisnips']
let g:which_key_map['w'] = [ ':AirlineToggleWhiteSpace', 'togle-whitespace']

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ 'b' : ['Buffers'   , 'fzf-buffer']      ,
      \ }


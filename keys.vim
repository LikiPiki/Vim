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

let g:which_key_map['_'] = { 'name': 'which_key_ignore' }

" --- Keybindings ---
let g:which_key_map['c'] = [ ':Commands', 'fuzzy-commands']
let g:which_key_map['B'] = [ ':BD', 'delete-buffers']
let g:which_key_map['w'] = [ ':AirlineToggleWhiteSpace', 'togle-whitespace']

" For coc-explorer
let g:which_key_map['e'] = [ ':CocCommand explorer', 'file-tree']
let g:which_key_map['E'] = [ ':CocCommand explorer --preset floating', 'file-tree-float']

let g:which_key_map.b = {
      \ 'name' : '+Buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ 'b' : ['Buffers'   , 'fzf-buffer']      ,
      \ 'F' : [':Lines'    , 'Find in buffer']  ,
      \ }


let g:which_key_map.u = {
      \ 'name' : '+Snippets' ,
	  \ 'l' : [':CocList snippets', 'Snippets list' ],
	  \ 'u' : [':UltiSnipsEdit', 'Ultisnips Edit' ],
      \ }

let g:which_key_map.f = {
      \ 'name' : '+Files' ,
	  \ 'f' : [':NERDTreeFind', 'Find file' ],
	  \ 's' : [':w', 'Save' ],
	  \ }


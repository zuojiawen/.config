" To use the configration file, you need install the plugin managment
" vim-plug.
" The plugin coc.nvim need nodejs specifed version









source ~/.config/nvim/plugin.vim 
source ~/.config/nvim/option.vim 
source ~/.config/nvim/func.vim
source ~/.config/nvim/map.vim


let g:rainbow_active = 1
let g:ranger_map_keys = 0
map <C-f> :Ranger<CR>

map <LEADER>f :FZF<CR>

"====
"====airline====
"====
let g:airline_theme='dark_minimal'
let g:airline#extensions#tabline#enabled = 0


" ===
" === nvim-dap
" ===    
au FileType dap-repl lua require('dap.ext.autocompl').attach()

lua require 'init'




























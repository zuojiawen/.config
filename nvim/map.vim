let mapleader = " "

" Tab management
map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>


" split and resize
map sl ;set splitright<CR>:vsplit<CR>
map sh ;set nosplitright<CR>:vsplit<CR>
map sk ;set nosplitbelow<CR>:split<CR>
map sj ;set splitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Search Mapping
noremap - Nzz
noremap = nzz
noremap <LEADER><CR> :nohlsearch<CR>

" To make nvim more easy to use
let mapleader = " "
noremap ; :
noremap J 5j
noremap K 5k
inoremap jk <Esc>
noremap <C-q> :q<CR>
noremap L $
noremap H 0
noremap <C-c> "+y
noremap erc :e $MYVIMRC<CR>
noremap src :w<CR>:source $MYVIMRC<CR>

" Run a script 
noremap <A-r> :w<CR>:! python3 % <CR>
noremap <C-r> :call CompileRunGcc()<CR>

" Jump Out Pair
inoremap jl <c-r>=JumpPair()<CR>

" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <leader>fl <cmd>Telescope git_files<cr>

"nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
"nnoremap <silent> <leader>dd :lua require('dap').continue()<CR>
"nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
"nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
"nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
"nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
"nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
"nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
"nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
"nnoremap <silent> <leader>dl :lua require'dap'.repl.run_last()<CR>`
"nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
"vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

" plugin mapping
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
map <C-f> :tabe<CR>:Ranger<CR>



" Markdown 
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>

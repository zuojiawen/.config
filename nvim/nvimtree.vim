:lua require'nvim-tree'.setup()

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]

highlight NvimTreeFolderName guifg=blue gui=bold,underline
highlight NvimTreeRootFolder guifg=blue gui=bold,underline
highlight NvimTreeEmptyFolderName guifg=blue gui=bold,underline
highlight NvimTreeOpenedFolderName guifg=blue gui=bold,underline


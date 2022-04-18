vim.cmd [[
try
    colorscheme everforest
    "colorscheme sonokai
    "colorscheme duskfox
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
endtry
]]

vim.cmd [[
highlight LineNr ctermfg=gray
highlight CursorLineNr ctermfg=yellow
"highlight Comment ctermfg=gray
highlight Visual ctermbg=241
]]

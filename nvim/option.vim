"Search setting
set ignorecase
"set smartcase
set hlsearch
set incsearch


" Use the key Tab to show the option.
set wildmenu
" Show last command in the status line.
" set showcmd



" some option
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4 
set foldmethod=indent
set foldlevelstart=99
set laststatus=2
set scrolloff=5
" set hidden 
set autochdir
" Load match bracket
"let loaded_matchparen=1
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Make the windows become more clear and beautiful. 
set number
set cursorline
set wrap
" set background=dark
" Always display a status line (it gets hidden sometimes otherwise).
" set laststatus=2


" vim-colorschemes 
"colorscheme gruvbox                     
" colorsheme can browsed by command SCORLL
syntax off

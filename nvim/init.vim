" To use the configration file, you need install the plugin managment
" vim-plug.
" The plugin coc.nvim need nodejs specifed version

" Make the windows become more clear and beautiful. 
set number
set cursorline
set wrap
" set background=dark
" Always display a status line (it gets hidden sometimes otherwise).
" set laststatus=2

" To make nvim more easy to use
" Edit key maping
let mapleader = " "
noremap ; :
noremap J 5j
noremap K 5k
inoremap jk <Esc>
noremap L $
noremap H 0
noremap erc :e $MYVIMRC<CR>

" Run a script 
noremap rs :w<CR>:! python3 % <CR>



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


" Tab management
map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>



"Search setting
set ignorecase
set smartcase
set hlsearch
set incsearch
noremap - Nzz
noremap = nzz
noremap <LEADER><CR> :nohlsearch<CR>


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
set clipboard=unnamed
set foldmethod=indent
set laststatus=2
set scrolloff=5
" set hidden 
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif




call plug#begin('~/.config/nvim/plugged')
  Plug 'vim-scripts/ScrollColors'
  Plug 'flazz/vim-colorschemes'
  Plug 'connorholyday/vim-snazzy'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'easymotion/vim-easymotion'
  Plug 'neoclide/coc.nvim',{'branch':'release'}
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/vimux'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
call plug#end()


source ~/.config/nvim/coc.vim
source ~/.config/nvim/nvimtree.vim



" ===
" ===nerdtree
" ===
map tt :NERDTreeToggle<CR>





"===
" ===vim-colorschemes plug
" ===
colorscheme smyck                     "colorsheme can browsed by command SCORLL
syntax off

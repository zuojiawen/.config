" To use the configration file, you need install the plugin managment
" vim-plug.
" The plugin coc.nvim need nodejs specifed version

lua require 'init'

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
noremap src :w<CR>:source $MYVIMRC<CR>

" Run a script 
noremap <LEADER>s :w<CR>:! python3 % <CR>



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
"set smartcase
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


" Compile function
noremap <C-r> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


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
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'preservim/nerdcommenter'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'luochen1990/rainbow'
call plug#end()


source ~/.config/nvim/coc.vim
source ~/.config/nvim/nvimtree.vim


let g:rainbow_active = 1
let g:ranger_map_keys = 0
map <LEADER>f :Ranger<CR>

"====
"====airline====
"====
let g:airline_theme='dark_minimal'
let g:airline#extensions#tabline#enabled = 1


" ===
" ===nerdtree
" ===
map tt :NERDTreeToggle<CR>





" ===
" ===vim-colorschemes plug
" ===
colorscheme smyck                     "colorsheme can browsed by command SCORLL
syntax off


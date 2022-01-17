" Install Plugin 
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin('~/.config/nvim/plugged')
  Plug 'vim-scripts/ScrollColors'
  Plug 'flazz/vim-colorschemes'
  "Plug 'connorholyday/vim-snazzy'
  Plug 'ryanoasis/vim-devicons'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  "Plug 'preservim/vimux'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'preservim/nerdcommenter'
  "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  "Plug 'junegunn/fzf.vim'
  "Plug 'neovim/nvim-lspconfig'
  Plug 'luochen1990/rainbow'
  " Markdown
  Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
  Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
  Plug 'dkarter/bullets.vim'
  Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer'), 'for': ['markdown'] }    "MarkdownPreview
  "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'scss'] }

  Plug 'chentau/marks.nvim'
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' } 

  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'

  Plug 'rafi/vim-venom', { 'for': 'python' }

  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/todo-comments.nvim'

call plug#end()


" rainbow 
let g:rainbow_active = 1
let g:ranger_map_keys = 0


" ===
" === nvim-dap
" ===    
au FileType dap-repl lua require('dap.ext.autocompl').attach()


:lua require'nvim-tree'.setup()
"let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
highlight NvimTreeFolderName guifg=blue gui=bold,underline
highlight NvimTreeRootFolder guifg=blue gui=bold,underline
highlight NvimTreeEmptyFolderName guifg=blue gui=bold,underline
highlight NvimTreeOpenedFolderName guifg=blue gui=bold,underline

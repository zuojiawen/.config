-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- lspconfig
  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}


	use {
	"hrsh7th/nvim-cmp",
	requires = {
	"hrsh7th/cmp-nvim-lsp",
	"onsails/lspkind-nvim",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lua",
	"octaltree/cmp-look",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-calc",
	"f3fora/cmp-spell",
	"hrsh7th/cmp-emoji",
	}
	}

	use {
	"L3MON4D3/LuaSnip",
	requires = {
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets"
	}
	}

	use 'mfussenegger/nvim-dap'
	use {'rcarriga/nvim-dap-ui'}
	--use 'nvim-telescope/telescope-dap.nvim' 
	use 'mfussenegger/nvim-dap-python'
	--use 'theHamsta/nvim-dap-virtual-text'

	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
	  "folke/todo-comments.nvim",
	  requires = "nvim-lua/plenary.nvim",
	  config = function()
		require("todo-comments").setup() 
	  end
	}

    use {
       'nvim-lualine/lualine.nvim',
       requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }


use "rebelot/kanagawa.nvim"
use 'shaunsingh/nord.nvim'
use 'Mofiqul/dracula.nvim'
use "rafamadriz/neon"
use 'marko-cerovac/material.nvim'
use 'shaunsingh/moonlight.nvim'
use 'folke/tokyonight.nvim'
use 'EdenEast/nightfox.nvim'
use "savq/melange"
use 'rmehri01/onenord.nvim'

use 'sainnhe/everforest'
use 'sainnhe/sonokai'
use "ellisonleao/gruvbox.nvim" 
use 'luisiacc/gruvbox-baby'
use 'sainnhe/gruvbox-material'


-- Editing Support
use {
  'abecodes/tabout.nvim',
  config = function()
    require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    enable_backwards = true, -- well ...
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}
  end,
	wants = {'nvim-treesitter'}, -- or require if not used so far
	after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
}



  if packer_bootstrap then
    require('packer').sync()
  end
end)





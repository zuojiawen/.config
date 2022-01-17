-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Automatically install and set up packer.nvim on any machine you clone your configuration to. 
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
	"hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
	--以下插件可选，可以根据个人喜好删减
	"onsails/lspkind-nvim", --美化自动完成提示信息
	"hrsh7th/cmp-buffer", --从buffer中智能提示
	"hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
	"octaltree/cmp-look", --用于完成英语单词
	"hrsh7th/cmp-path", --自动提示硬盘上的文件
	"hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
	"f3fora/cmp-spell", --nvim-cmp 的拼写源基于 vim 的拼写建议
	"hrsh7th/cmp-emoji", --输入: 可以显示表情
	}
	}

	-- 代码段提示
	use {
	"L3MON4D3/LuaSnip",
	requires = {
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	"rafamadriz/friendly-snippets" --代码段合集
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







  if packer_bootstrap then
    require('packer').sync()
  end
end)





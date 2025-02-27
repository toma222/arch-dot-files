

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'
	use { "ellisonleao/gruvbox.nvim" }
	use 'flazz/vim-colorschemes'
 	use {
  		'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
  		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('mbbill/undotree')
	use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v2.x',
  	requires = {
    	-- LSP Support
    	{'neovim/nvim-lspconfig'},             -- Required
    	{                                      -- Optional
      		'williamboman/mason.nvim',
      		run = function()
        	pcall(vim.api.nvim_command, 'MasonUpdate')
      		end,
    	},
    		{'williamboman/mason-lspconfig.nvim'},
		{'williamboman/mason.nvim'},

		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-nvim-lua'},



    		-- Autocompletion
    		{'hrsh7th/nvim-cmp'},     -- Required
    		{'hrsh7th/cmp-nvim-lsp'}, -- Required
   		{'L3MON4D3/LuaSnip'},     -- Required
 	 },

	 use('vim-airline/vim-airline'),
	 use('vim-airline/vim-airline-themes'),

	 use('nvim-tree/nvim-tree.lua'),
	 use('nvim-tree/nvim-web-devicons'),

	 use {
		 'akinsho/bufferline.nvim',
		 tag = "*",
		 requires = 'nvim-tree/nvim-web-devicons'
 	 },

	-- packer
	use {
    		"nvim-telescope/telescope-file-browser.nvim",
    		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},

	use ('boltlessengineer/bufterm.nvim'),

	use ('nvim-lua/plenary.nvim'),
	use ('j-morano/buffer_manager.nvim'),
	use ('RRethy/base16-nvim'),
	use ('rhysd/vim-clang-format'),
	use ('cdelledonne/vim-cmake')
}
end)

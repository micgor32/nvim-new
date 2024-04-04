-- Based on https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Initializing required plugins
require("lazy").setup({
    {
    	'nvim-telescope/telescope.nvim', tag = '0.1.6',
      	   dependencies = { 'nvim-lua/plenary.nvim' }
    },
    "tpope/vim-commentary",
    "rose-pine/neovim",
    "nvim-treesitter/nvim-treesitter",
    "tpope/vim-fugitive",
    {
 		"folke/trouble.nvim",
 			dependencies = { "nvim-tree/nvim-web-devicons" },
 			opts = { }, -- Default settings for now --
    },
    {
        "folke/zen-mode.nvim",
        	opts = {
	  			alacritty = {
            	enabled = true,
            	font = "16",
	  		},
		}
    },
	"nvim-telescope/telescope-file-browser.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
        	"hrsh7th/cmp-buffer",
        	"hrsh7th/cmp-path",
        	"hrsh7th/cmp-cmdline",
        	"hrsh7th/nvim-cmp",
		}
	}
})

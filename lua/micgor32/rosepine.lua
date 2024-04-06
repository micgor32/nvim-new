require("rose-pine").setup({
	variant = "moon",
	dark_variant = "moon",

	enable = {
	  terminal = true,
	},

	styles = {
          bold = true,
          italic = true,
          transparency = false,
    	},
})

vim.cmd("colorscheme rose-pine")
require("lualine").setup()

require("rose-pine").setup({
	variant = "moon",
	dark_variant = "moon",

	enable = {
	  terminal = true,
	},

	styles = {
          bold = true,
          italic = true,
          transparency = true,
    	},
})

vim.cmd("colorscheme rose-pine")

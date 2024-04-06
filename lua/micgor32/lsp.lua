local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")
local luasnip = require("luasnip")
local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities())

require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").lua_ls.setup {
	capabilities = capabilities,
}

-- require("lspconfig").ruff_lsp.setup {
--  	init_options = {
--      settings = {
--        args = {},
--      }
--    }
--  }


require("lspconfig").jedi_language_server.setup({
	capabilities = capabilities,
})

require("lspconfig").clangd.setup{
	capabilities = capabilities,
}

-- local has_words_before = function()
-- 	unpack = unpack or table.unpack
-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- local cmp_select = { behaviour = cmp.SelectBehaviour.Select }

require("luasnip.loaders.from_vscode").load({ include = { "python" } })

cmp.setup({
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
			-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			-- elseif has_words_before() then
			-- 	cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

	-- 	cmp.mapping.preset.insert({
	-- 		 ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
	-- 		 ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
	-- 		 ["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 		 ["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 		 ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
	-- 		 ["<C-e>"] = cmp.mapping.abort(), -- close completion window
	-- 		["<CR>"] = cmp.mapping.confirm({ select = false }),
	-- 	}),
	},
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
       	{ name = 'luasnip' },
    }, {
        { name = 'buffer' },
	})
})

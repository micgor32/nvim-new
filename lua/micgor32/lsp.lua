local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")
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
require("lspconfig").ruff_lsp.setup {
	capabilities = capabilities,
	init_options = {
    settings = {
      args = {},
    }
  }
}


-- local cmp_select = { behaviour = cmp.SelectBehaviour.Select }

cmp.setup({
	-- mapping = cmp.mapping.preset.insert({
        -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        -- ["<C-Space>"] = cmp.mapping.complete(),
    -- }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
       -- { name = 'luasnip' }, leave for now 
    }, {
        { name = 'buffer' },
	})
})

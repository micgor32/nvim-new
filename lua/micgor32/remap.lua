vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("n", "<leader>sa", vim.cmd.Ex)
keymap.set("n", "<leader>nn", ":nohl<CR>")
keymap.set("i", "^", "<ESC>") -- Only here if working on laptop !!

-- zoom in/out --
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- moving through the windows --
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>l", "<C-w>l")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>v", "<C-w>v")

-- Telescope magic here :D --
local builtin = require("telescope.builtin")

require("telescope").setup{
  extensions = {
    file_browser = {
      grouped = true,
      sorting_strategy = 'ascending',
    },
  },
}

keymap.set("n", "<leader>sf", builtin.find_files, {})
keymap.set("n", "<leader>sg", builtin.live_grep, {})
keymap.set("n", "<leader>sb", builtin.buffers, {})
keymap.set("n", "<leader>sh", builtin.help_tags, {})
keymap.set("n", "<leader>f", function() require("telescope").extensions.file_browser.file_browser() end)

-- Git stuff --
-- TODO --

-- Trouble --
keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
keymap.set("n", "<leader>r", function() require("trouble").toggle("lsp_references") end)
keymap.set("n", "<leader>rd", function() require("trouble").toggle("lsp_definitions") end)
keymap.set("n", "<leader>rt", function() require("trouble").toggle("lsp_type_definitions") end)

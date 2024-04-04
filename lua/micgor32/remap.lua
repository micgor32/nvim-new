vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("n", "<leader>f", vim.cmd.Ex)
keymap.set("n", "<leader>nn", ":nohl<CR>")

-- zoom in/out --
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- moving through the windows --
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>l", "<C-w>l")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")

-- Telescope magic here :D --
local builtin = require("telescope.builtin")

keymap.set("n", "<leader>sf", builtin.find_files, {})
keymap.set("n", "<leader>sg", builtin.live_grep, {})
keymap.set("n", "<leader>sb", builtin.buffers, {})
keymap.set("n", "<leader>sh", builtin.help_tags, {})
keymap.set("n", "<leader>sa", function() require("telescope").extensions.file_browser.file_browser() end)

-- Git stuff --
-- TODO --

-- Trouble --
keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
keymap.set("n", "<leader>rr", function() require("trouble").toggle("lsp_references") end)

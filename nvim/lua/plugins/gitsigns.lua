-- Git integration for buffers
-- https://github.com/lewis6991/gitsigns.nvim

require("gitsigns").setup({current_line_blame = true})

vim.keymap.set("n", "<leader>gbl", "<Cmd>Gitsigns blame_line<CR>")
vim.keymap.set("n", "<leader>gd",  "<Cmd>Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>gs",  "<Cmd>Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>gr",  "<Cmd>Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>gnh", "<Cmd>Gitsigns next_hunk<CR>")
vim.keymap.set("n", "<leader>gph", "<Cmd>Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "<leader>gh",  "<Cmd>Gitsigns preview_hunk<CR>")

-- Файловый менеджер
-- https://github.com/stevearc/oil.nvim

require("oil").setup({
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
})

vim.keymap.set("n", "<leader>fe", "<Cmd>Oil<CR>")
vim.keymap.set("n", "<leader>fr", "<Cmd>Oil --float<CR>")

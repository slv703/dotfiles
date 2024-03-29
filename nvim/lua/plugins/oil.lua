-- Файловый менеджер
-- https://github.com/stevearc/oil.nvim

require("oil").setup({
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  view_options = {
    show_hidden = true
  }
})

vim.keymap.set("n", "<leader>fe", "<Cmd>Oil<CR>")
vim.keymap.set("n", "<leader>fr", "<Cmd>Oil --float<CR>")

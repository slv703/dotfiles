-- Git integration for buffers
-- https://github.com/lewis6991/gitsigns.nvim

return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({ current_line_blame = true })

      vim.keymap.set("n", "<leader>gbl", "<Cmd>Gitsigns blame_line<CR>")
      vim.keymap.set("n", "<leader>gd",  "<Cmd>Gitsigns diffthis<CR>")
      vim.keymap.set("n", "<leader>gh",  "<Cmd>Gitsigns preview_hunk<CR>")
      vim.keymap.set("n", "<leader>gr",  "<Cmd>Gitsigns reset_hunk<CR>")
      vim.keymap.set("n", "<leader>gs",  "<Cmd>Gitsigns stage_hunk<CR>")
      vim.keymap.set('v', '<leader>gs',  "<Cmd>'<,'>Gitsigns stage_hunk<CR>")
      vim.keymap.set("n", "<leader>gs",  "<Cmd>Gitsigns stage_hunk<CR>")
      vim.keymap.set("n", "<leader>nh", "<Cmd>Gitsigns next_hunk<CR>")
      vim.keymap.set("n", "<leader>ph", "<Cmd>Gitsigns prev_hunk<CR>")
    end,
    lazy = false
  }
}

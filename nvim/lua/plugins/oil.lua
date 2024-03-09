-- Файловый менеджер
-- https://github.com/stevearc/oil.nvim

return {
  {
    "stevearc/oil.nvim",
    columns = { "icon" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>fe", "<Cmd>Oil<CR>" },
      { "<leader>fr", "<Cmd>Oil --float<CR>" }
    },
    view_options = { show_hidden = true }
  }
}

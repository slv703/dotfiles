-- Soothing pastel theme for (Neo)vim
-- https://github.com/catppuccin/nvim

return {
  {
    "catppuccin/nvim",
    config = function()
      vim.g.catppuccin_flavour = 'macchiato'
      vim.cmd [[colorscheme catppuccin]]
    end,
    flavour = "macchiato",
    lazy = false,
    name = "catppuccin",
    priority = 1000
  }
}

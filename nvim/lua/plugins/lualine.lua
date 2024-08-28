-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- https://github.com/nvim-lualine/lualine.nvim

return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({})
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false
  }
}

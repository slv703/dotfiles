-- Lightweight yet powerful formatter plugin for Neovim
-- https://github.com/stevearc/conform.nvim

return {
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        -- Map of filetype to formatters
        formatters_by_ft = {
          ruby = { "rubocop", "codespell" }
        }
      })
    end
  }
}

return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        patterns = {
          default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'else',
            'switch',
            'case',
          },
          javascript = {
            'object',
            'pair',
          },
          ruby = {
            'module',
            'block'
          },
          yaml = {
            'block_mapping_pair',
            'block_sequence_item',
          },
          json = {
            'object',
            'pair',
          },
        },
      })
    end,
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },

  { 'RRethy/nvim-treesitter-endwise', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { "lua", "javascript", "html", "ruby" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },
}

-- Part I. Lazy install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Part II. Lazy setup
require("lazy").setup({
  -- File exploler
  { 'stevearc/oil.nvim', dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

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

  -- LSP

  { "neovim/nvim-lspconfig" },
  {'folke/tokyonight.nvim'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  -- LSP Support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    }
  },

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  { 'L3MON4D3/LuaSnip', requires = { 'hrsh7th/nvim-cmp' } },

  -- Autocompletion
  { 'hrsh7th/nvim-cmp', dependencies = { {'L3MON4D3/LuaSnip'} } },

  -- Status line
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  -- Autosave
  { "Pocco81/auto-save.nvim" },

  -- Popup with suggestions to complete a key binding
  { "folke/which-key.nvim" },

  -- Indentation style detection
  { "nmac427/guess-indent.nvim" },

  -- Comment lines with shortcuts
  { "numToStr/Comment.nvim" },

  -- Git integration for buffers
  { "lewis6991/gitsigns.nvim" }
})

-- Part III. Plugins setup
require('plugins/nvim_web_devicons')
require('plugins/oil')
require('plugins/catppuccian')
require('plugins/telescope')
require('plugins/lualine')
require('auto-save').setup()
require('which-key').setup()
require('guess-indent').setup()
require('Comment').setup()
require('plugins/gitsigns')

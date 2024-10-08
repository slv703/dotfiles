-- A completion plugin for neovim coded in Lua
-- https://github.com/hrsh7th/nvim-cmp

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
    },
    config = function()
      -- Set up nvim-cmp.
      local cmp = require'cmp'

    cmp.setup({
     snippet = {
       expand = function(args)
         require('luasnip').lsp_expand(args.body)
       end,
     },
     window = {
       completion = cmp.config.window.bordered(),
       documentation = cmp.config.window.bordered(),
     },
     mapping = cmp.mapping.preset.insert({
       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
       ['<C-f>'] = cmp.mapping.scroll_docs(4),
       ['<C-Space>'] = cmp.mapping.complete(),
       ['<C-e>'] = cmp.mapping.abort(),
       -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
       ['<CR>'] = cmp.mapping.confirm({ select = true }),
     }),
     sources = cmp.config.sources({
       { name = 'nvim_lsp' },
       { name = 'luasnip' },
     },
     { { name = 'buffer' }, })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        -- You can specify `git` source if [you were installed it](https://github.com/petertriho/cmp-git)
        { name = 'git' },
      },
      { { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = 'buffer' } }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      },
      {
        { name = 'cmdline' }
      })
    })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig').solargraph.setup {
      capabilities = capabilities
    }
   end,
 }
}

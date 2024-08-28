-- Snippet Engine for Neovim written in Lua
-- https://github.com/L3MON4D3/LuaSnip

return {
  {
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require("luasnip.loaders.from_snipmate").lazy_load()

      local ls = require("luasnip");

      vim.keymap.set("i", "<D-k>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<D-l>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<D-j>", function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({"i", "s"}, "<D-e>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})
    end,
    dependencies = { "saadparwaiz1/cmp_luasnip" },
    lazy = false
  },

  { 'benfowler/telescope-luasnip.nvim' }
}

-- Поиск, фильтрация, предпоказ и выделение файлов.
-- https://github.com/nvim-telescope/telescope.nvim

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').load_extension('fzf')
      require('telescope').load_extension('luasnip')

      require('telescope').setup({
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
          }
        },
        pickers = {
          find_files = {
            -- hidden = true,
            -- ignore = true
          },
          treesitter = {
          }
        }
      })
    end,
    lazy = false,
    keys = {
      -- File Pickers

      -- Список файлов в текущем рабочем каталоге с учетом .gitignore
      { "<C-f>", "<Cmd>Telescope find_files<CR>" },
      { "<D-f>", "<Cmd>Telescope find_files<CR>" },
      { "<D-а>", "<Cmd>Telescope find_files<CR>" },
      { "<leader>ff", "<Cmd>Telescope find_files<CR>" },

      -- Нечеткий поиск по выводу команды git ls-files с учетом .gitignore
      { "<leader>gf", "<Cmd>Telescope git_files<CR>" },

      -- Поиск строки под курсором или выделенной строки в текущем рабочем каталоге
      { "<leader>fs", "<Cmd>Telescope grep_string<CR>" },

      -- Поиск строки в текущем рабочем каталоге и выдача результатов по мере ввода, с учётом .gitignore
      { "<D-g>", "<Cmd>Telescope live_grep<CR>" },

      -- Восстановить последний Telescope буффер
      { "<D-t>", "<Cmd>Telescope resume<CR>" },
      { "<D-s>", "<Cmd>Telescope resume<CR>" },
      { "<D-ы>", "<Cmd>Telescope resume<CR>" },

      -- Vim Pickers

      -- Список открытых буферов
      { "<D-b>", "<Cmd>Telescope buffers<CR>" },

      -- Ранее открытые файлы
      { "<D-o>", "<Cmd>Telescope oldfiles<CR>" },

      -- Поиск по текущему буфферу
      { "<leader>cf", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
      { "<D-e>", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },
      { "<D-у>", "<Cmd>Telescope current_buffer_fuzzy_find<CR>" },

      -- Git Pickers

      -- Lists git commits with diff preview
      { "<leader>gm", "<Cmd>Telescope git_commits<CR>" },

      -- Lists buffer's git commits with diff preview
      { "<leader>gb", "<Cmd>Telescope git_bcommits<CR>" },

      -- Lists buffer's git commits in a range of lines
      { "<leader>ge", "<Cmd>Telescope git_bcommits_range<CR>" },

      -- Lists all branches with log preview
      { "<leader>gb", "<Cmd>Telescope git_branches<CR>" },

      -- Lists current changes per file with diff preview
      { "<leader>gs", "<Cmd>Telescope git_status<CR>" },

      -- Lists stash items in current repository with ability to apply them
      { "<leader>gh", "<Cmd>Telescope git_stash<CR>" },

      -- Treesitter Picker

      -- Lists Function names, variables, from Treesitter
      { "<leader>ts", "<Cmd>Telescope treesitter<CR>" }
    }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
}

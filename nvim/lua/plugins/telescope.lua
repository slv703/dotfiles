-- Поиск, фильтрация, предпоказ и выделение файлов.
-- https://github.com/nvim-telescope/telescope.nvim

require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
})

require('telescope').load_extension('fzf')

-- File Pickers

-- Список файлов в текущем рабочем каталоге с учетом .gitignore
vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
-- Нечеткий поиск по выводу команды git ls-files с учетом .gitignore
vim.keymap.set("n", "<leader>gf", "<Cmd>Telescope git_files<CR>")
-- Поиск строки под курсором или выделенной строки в текущем рабочем каталоге
vim.keymap.set("n", "<leader>fs", "<Cmd>Telescope grep_string<CR>")
-- Поиск строки в текущем рабочем каталоге и выдача результатов по мере ввода, с учётом .gitignore
vim.keymap.set("n", "<leader>lg", "<Cmd>Telescope live_grep<CR>")

-- Vim Pickers

-- Список открытых буферов
vim.keymap.set("n", "<leader>bf", "<Cmd>Telescope buffers<CR>")
-- Ранее открытые файлы
vim.keymap.set("n", "<leader>of", "<Cmd>Telescope oldfiles<CR>")
-- Поиск по текущему буфферу
vim.keymap.set("n", "<leader>cf", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")

-- Git Pickers

-- Lists git commits with diff preview
vim.keymap.set("n", "<leader>gc", "<Cmd>Telescope git_commits<CR>")
-- Lists buffer's git commits with diff preview
vim.keymap.set("n", "<leader>bgc", "<Cmd>Telescope git_bcommits<CR>")
-- Lists buffer's git commits in a range of lines
vim.keymap.set("v", "<leader>gcr", "<Cmd>Telescope git_bcommits_range<CR>")
-- Lists all branches with log preview
vim.keymap.set("n", "<leader>gb", "<Cmd>Telescope git_branches<CR>")
-- Lists current changes per file with diff preview
vim.keymap.set("n", "<leader>gs", "<Cmd>Telescope git_status<CR>")
-- Lists stash items in current repository with ability to apply them
vim.keymap.set("n", "<leader>gh", "<Cmd>Telescope git_stash<CR>")

-- Treesitter Picker

-- Lists Function names, variables, from Treesitter
vim.keymap.set("n", "<leader>ts", "<Cmd>Telescope treesitter<CR>")

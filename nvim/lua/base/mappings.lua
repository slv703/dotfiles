-- Использование пробела в качестве <leader>
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Change without yanking
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("v", "c", '"_c')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("v", "C", '"_C')

-- Сбросить визуальное выделение поисковой фразы
vim.keymap.set("n", "<leader>vr", "<Cmd>noh<CR>")

vim.keymap.set("n", "<leader>mm", "<Cmd>!mattermost-desktop<CR><CR>")

vim.keymap.set("n", "<leader>iri", "<Cmd>!docker-compose restart insales<CR><CR>")
vim.keymap.set("n", "<leader>irs", "<Cmd>!docker-compose restart sidekiq<CR><CR>")

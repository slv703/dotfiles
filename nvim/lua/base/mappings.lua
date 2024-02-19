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

-- inSales
vim.keymap.set("n", "<leader>bro", "<Cmd>!xdg-open $INSALES_BRO770_LOGIN_URL<CR><CR>")
vim.keymap.set("n", "<leader>idm", "<Cmd>!xdg-open $DAILY_MEETING_URL<CR><CR>")
vim.keymap.set("n", "<leader>ifs", "<Cmd>!xdg-open $INSALES_GITLAB_STOPPED_STAGINGS_URL<CR><CR>")
vim.keymap.set("n", "<leader>imp", "<Cmd>!xdg-open $INSALES_GITLAB_MASTER_PIPLINES_URL<CR><CR>")
vim.keymap.set("n", "<leader>imr", "<Cmd>!xdg-open $INSALES_GITLAB_MY_OPEN_MERGE_REQUESTS_URL<CR><CR>")
vim.keymap.set("n", "<leader>ip", "<Cmd>vsplit term://docker-compose exec insales bundler exec pronto run<CR>")
vim.keymap.set("n", "<leader>iri", "<Cmd>!docker-compose restart insales<CR><CR>")
vim.keymap.set("n", "<leader>irs", "<Cmd>!docker-compose restart sidekiq<CR><CR>")

-- git
vim.keymap.set("n", "<leader>gdm", "<Cmd>vsplit term://git diff master...<CR>")

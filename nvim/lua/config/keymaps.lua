-- Использование пробела в качестве <leader>
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "л", 'k') -- up
vim.keymap.set("n", "о", 'j') -- down
vim.keymap.set("n", "р", 'h') -- left
vim.keymap.set("n", "д", 'l') -- right

vim.keymap.set("n", "ш", 'i') -- enable insert mode

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
vim.keymap.set("n", "<leader>ip", "<Cmd>vsplit term://bundler exec pronto run --unstaged<CR>")
vim.keymap.set("n", "<leader>iri", "<Cmd>!docker-compose restart insales<CR><CR>")
vim.keymap.set("n", "<leader>irs", "<Cmd>!docker-compose restart sidekiq<CR><CR>")

-- helpers
vim.keymap.set("n", "<leader>sse", "<Cmd>!gitStashApplyByName omniauth_skip_cert_load<CR><CR>")
vim.keymap.set("n", "<leader>sdm", "<Cmd>!gitStashApplyByName ngrok_domain<CR><CR>")

-- git
vim.keymap.set("n", "<leader>gdm", "<Cmd>vsplit term://git diff master...<CR>")

-- inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
-- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

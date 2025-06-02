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

-- tabs
vim.keymap.set("n", "<leader>tc", "<Cmd>tabclose<CR>")

-- windows (en)
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-l>", "<C-w>l")

-- windows (ru)
vim.keymap.set("n", "<M-о>", "<C-w>j")
vim.keymap.set("n", "<M-л>", "<C-w>k")
vim.keymap.set("n", "<M-р>", "<C-w>h")
vim.keymap.set("n", "<M-д>", "<C-w>l")

vim.keymap.set("n", "<leader>wr", "<C-w>r")
vim.keymap.set("n", "<leader>we", "<C-w>R")

vim.keymap.set("n", "<leader>wk", "<C-w>K")
vim.keymap.set("n", "<leader>wj", "<C-w>J")
vim.keymap.set("n", "<leader>wh", "<C-w>H")
vim.keymap.set("n", "<leader>wl", "<C-w>L")

vim.keymap.set("n", "<leader>wx", "<C-w>x")
vim.keymap.set("n", "<leader>wt", "<C-w>T")

vim.keymap.set("i", "<M-c>", "<C-S-c>")
vim.keymap.set("i", "<M-v>", "<C-S-v>")

-- Выход из терминального режима по клавише Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set("n", "<Esc><Esc>", "<C-w>c")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
-- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

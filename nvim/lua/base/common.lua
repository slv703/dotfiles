-- Отображать номера строк
vim.opt.number = true
-- Относительные номера строк
vim.opt.relativenumber = true
-- Количество строк перед и после курсора
vim.opt.scrolloff = 5
-- Использовать системный буфер
vim.opt.clipboard = "unnamedplus"
-- Подсвечивать текущую строку
vim.opt.cursorline = true
-- Включает 24-битный цвет RGB
vim.opt.termguicolors = true
-- Faster auto-completion and etc
vim.opt.updatetime = 50
vim.opt.splitright = true
vim.opt.splitbelow = true
-- show trailing whitespaces, tabs
vim.opt.list = true
vim.opt.listchars = { tab = '▸▸', trail = '•', nbsp = '␣', extends = '…' }

vim.opt.shell='/usr/bin/zsh'

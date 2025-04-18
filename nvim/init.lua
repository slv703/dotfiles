require('autocommands/common')
require('config/options')
require('config/keymaps')
require('base/search')
require('base/tabs')
require('commands/format')
require('commands/other')
require("config.lazy")

-- disable mouse
vim.o.mouse = ""

vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

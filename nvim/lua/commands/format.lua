-- Custom commands for text formating

function change_case(word)
  local new_word = ''

  -- Detect camelCase
  if word:find('[a-z][A-Z]') then
    -- Convert camelCase to snake_case
    new_word = word:gsub('([a-z])([A-Z])', '%1_%2'):lower()
    -- Detect snake_case
  elseif word:find('_[a-z]') then
    -- Convert snake_case to camelCase
    new_word = word:gsub('(_)([a-z])', function(_, l) return l:upper() end)
    new_word = new_word:gsub('(::)([a-z])', function(_, l) return '::' .. l:upper() end)
    new_word = new_word:gsub('^[a-z]', function(l) return l:upper() end)
  else
    print("Not a snake_case or camelCase word")
  end

  return new_word
end

-- Выравнивает строки по знаку равенства
vim.api.nvim_create_user_command(
  "EqualSignFormat",
  function(opts)
    local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)

    local max_position = 0
    for number, line in pairs(lines) do
      line = line:gsub("%s+=", "="):gsub("=%s+", "=")
      local position, _ = line:find('=')
      if position ~= nil then
        max_position = (position > max_position and position or max_position)
        lines[number] = { line:sub(1, position - 1), line:sub(position + 1, line:len()) }
      end
    end

    for number, line in pairs(lines) do
      if type(line) == 'table' then
        lines[number] = ("%%-%ds = %%s"):format(max_position-1):format(line[1], line[2])
      end
    end

    vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, lines)
  end,
  { nargs = "?", range = true }
)
vim.keymap.set("v", "<leader>esf", ":EqualSignFormat<CR>")

-- Автонумерация выделенных строк
vim.api.nvim_create_user_command(
  "Autonumbering",
  function(opts)
    local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)

    for number, line in pairs(lines) do
      lines[number] = ("%d. %s"):format(number, line)
    end

    vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, lines)
  end,
  { nargs = "?", range = true }
)
vim.keymap.set("v", "<leader>an", ":Autonumbering<CR>")

-- Удаление нумерации строк
vim.api.nvim_create_user_command(
  "DeleteNumbering",
  function(opts)
    local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)

    for number, line in pairs(lines) do
      lines[number] = line:gsub("%d+%. ", "")
    end

    vim.api.nvim_buf_set_lines(0, opts.line1 - 1, opts.line2, false, lines)
  end,
  { nargs = "?", range = true }
)
vim.keymap.set("v", "<leader>dn", ":DeleteNumbering<CR>")


vim.api.nvim_create_user_command(
  "ChangeCase",
  function(opts)
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local word = vim.fn.expand('<cword>')
    local word_start = vim.fn.matchstrpos(vim.fn.getline('.'), '\\k*\\%' .. (col+1) .. 'c\\k*')[2]

    local new_word = ''

    -- Detect camelCase
    if word:find('[a-z][A-Z]') then
      -- Convert camelCase to snake_case
      new_word = word:gsub('([a-z])([A-Z])', '%1_%2'):lower()
    -- Detect snake_case
    elseif word:find('_[a-z]') then
      -- Convert snake_case to camelCase
      new_word = word:gsub('(_)([a-z])', function(_, l) return l:upper() end)
      new_word = new_word:gsub('^[a-z]', function(l) return l:upper() end)
    else
      print("Not a snake_case or camelCase word")
    end

    vim.api.nvim_buf_set_text(0, line - 1, word_start, line - 1, word_start + #word, {new_word})
  end,
  { nargs = "?", range = true }
)
vim.keymap.set("n", "<leader>cc", ":ChangeCase<CR>")

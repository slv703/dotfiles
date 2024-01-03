-- Custom commands for text formating

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

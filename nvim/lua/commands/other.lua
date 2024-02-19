-- Возвращает относительный путь к текущему файлу
function current_file_relative_path()
  return vim.api.nvim_buf_get_name(0):gsub(vim.loop.cwd(), ''):sub(2, -1)
end

-- Возвращает Gitlab ссылку на текущий файл
function gitlab_file_url()
  local file_path = current_file_relative_path()
  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  -- TODO: определять текущий проект в рантайме
  return ("%s/-/blob/master/%s#L%d"):format(os.getenv("INSALES_GITLAB_URL"), file_path, line_number)
end

-- Сохраняет Gitlab ссылку на текущий файл в буффере обмена
vim.api.nvim_create_user_command(
  "GitlabRef",
  function(opts)
    io.popen(("echo %s | xclip -selection clipboard"):format(gitlab_file_url())):close()
  end,
  { nargs = "?", range = false }
)
vim.keymap.set("n", "<leader>glr", ":GitlabRef<CR>")

-- Открывает текущий файл в Gitlab в браузере
vim.api.nvim_create_user_command(
  "OpenInGitlab",
  function(opts)
    io.popen(("xdg-open '%s'"):format(gitlab_file_url())):close()
  end,
  { nargs = "?", range = false }
)
vim.keymap.set("n", "<leader>glo", ":OpenInGitlab<CR>")

-- Записывает путь до текущего файла в буффер обмена
vim.api.nvim_create_user_command(
  "CopyPath",
  function(opts)
    local file_path = current_file_relative_path()
    io.popen(("echo %s | xclip -selection clipboard"):format(file_path)):close()
  end,
  { nargs = "?", range = false }
)
vim.keymap.set("n", "<leader>cp", ":CopyPath<CR>")

-- Открывает файл с тестами, либо файл с исходниками
vim.api.nvim_create_user_command(
  "MoveToSpecOrToSource",
  function(opts)
    local file_path = current_file_relative_path()
    local is_spec = file_path:find('spec')

    if is_spec then
      file_path = file_path:gsub('_spec', ''):gsub('spec', 'app')
    else
      file_path = file_path:gsub('app', 'spec'):gsub('.rb', '_spec.rb')
    end

    vim.cmd('edit ' .. file_path)
  end,
  { nargs = "?", range = false }
)
vim.keymap.set("n", "<leader>ms", ":MoveToSpecOrToSource<CR>")

-- Запускает файл с тестами
vim.api.nvim_create_user_command(
  "StartSpec",
  function(opts)
    local file_path = current_file_relative_path()
    local is_spec = file_path:find('spec')
    local line_number = vim.api.nvim_win_get_cursor(0)[1]

    if is_spec then
      file_path = ("%s:%d"):format(file_path, line_number)
    else
      file_path = file_path:gsub('app', 'spec'):gsub('.rb', '_spec.rb')
    end

    vim.cmd('vsplit term://docker-compose exec insales bundler exec rspec ' .. file_path)
  end,
  { nargs = "?", range = false }
)
vim.keymap.set("n", "<leader>ss", ":StartSpec<CR>")

-- Подсчёт суммы по выделенным строкам
vim.api.nvim_create_user_command(
  "PrintSum",
  function(opts)
    local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)

    local sum = 0
    for number, line in pairs(lines) do
      sum = sum + line:match("%d+.%d+")
    end

    print(sum)
  end,
  { nargs = "?", range = true }
)

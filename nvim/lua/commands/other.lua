-- Возвращает Gitlab ссылку на текущий файл
function gitlab_file_url()
  local file_path = vim.api.nvim_buf_get_name(0):gsub(vim.loop.cwd(), '')
  local line_number = vim.api.nvim_win_get_cursor(0)[1]
  -- TODO: определять текущий проект в рантайме
  return ("%s/-/blob/master%s#L%d"):format(os.getenv("INSALES_GITLAB_URL"), file_path, line_number)
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
    io.popen(("echo %s | xclip -selection clipboard"):format(vim.api.nvim_buf_get_name(0))):close()
  end,
  { nargs = "?", range = false }
)
vim.keymap.set("n", "<leader>cp", ":CopyPath<CR>")

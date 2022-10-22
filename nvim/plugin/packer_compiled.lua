-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alex/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-save.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14auto-save\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n®\5\0\0\5\0\"\0D6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\20\0'\4\21\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\22\0'\4\23\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\24\0'\4\25\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\26\0'\4\27\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\28\0'\4\29\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\30\0'\4\31\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3 \0'\4!\0B\0\4\1K\0\1\0 <Cmd>Gitsigns prev_hunk<CR>\a[g <Cmd>Gitsigns next_hunk<CR>\a]g!<Cmd>Gitsigns blame_line<CR>\15<leader>gb!<Cmd>Gitsigns reset_hunk<CR>\15<leader>gr!<Cmd>Gitsigns stage_hunk<CR>\15<leader>gs#<Cmd>Gitsigns preview_hunk<CR>\15<leader>gh\31<Cmd>Gitsigns diffthis<CR>\15<leader>gd\6n\bset\vkeymap\bvim\nsigns\1\0\0\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\bâ€¾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\6~\badd\1\0\0\1\0\1\ttext\6+\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/nmac427/guess-indent.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  nvim = {
    config = { "\27LJ\2\n–\1\0\0\3\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\1\6\0=\1\5\0006\0\3\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd\14macchiato\23catppuccin_flavour\6g\bvim\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expand.\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19nvim_list_bufs\bapi\bvimÓ\5\1\0\r\0)\0\\6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0049\5\t\0009\5\n\0059\5\v\0055\a\r\0009\b\t\0009\b\f\b)\nþÿB\b\2\2=\b\14\a9\b\t\0009\b\f\b)\n\2\0B\b\2\2=\b\15\a9\b\t\0009\b\16\bB\b\1\2=\b\17\a9\b\t\0009\b\18\b5\n\21\0009\v\19\0009\v\20\v=\v\22\nB\b\2\2=\b\23\aB\5\2\2=\5\t\0044\5\4\0005\6\24\0>\6\1\0055\6\25\0005\a\27\0003\b\26\0=\b\28\a=\a\29\6>\6\2\0055\6\30\0>\6\3\5=\5\31\4B\2\2\0019\2\3\0009\2 \2'\4!\0005\5\"\0009\6\t\0009\6\n\0069\6 \6B\6\1\2=\6\t\0059\6#\0009\6\31\0064\b\3\0005\t$\0>\t\1\bB\6\2\2=\6\31\5B\2\3\0016\2%\0005\4&\0B\2\2\4X\5\14€9\a\3\0009\a \a\18\t\6\0005\n'\0009\v\t\0009\v\n\v9\v \vB\v\1\2=\v\t\n4\v\3\0005\f(\0>\f\1\v=\v\31\nB\a\3\1E\5\3\3R\5ð2\0\0€K\0\1\0\1\0\2\tname\vbuffer\19max_item_count\3\n\1\0\0\1\3\0\0\6/\6?\vipairs\1\0\1\tname\fcmdline\vconfig\1\0\0\6:\fcmdline\fsources\1\0\1\tname\tpath\voption\15get_bufnrs\1\0\1\20keyword_pattern\t\\k\\+\0\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nabort\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nd\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprint@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvim×\5\1\2\t\0\30\0v5\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0006\a\2\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0006\a\2\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0006\a\2\0009\a\a\a9\a\b\a9\a\17\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0003\a\19\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0006\a\2\0009\a\a\a9\a\b\a9\a\21\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0006\a\2\0009\a\a\a9\a\b\a9\a\23\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0006\a\2\0009\a\a\a9\a\b\a9\a\25\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\26\0006\a\2\0009\a\a\a9\a\b\a9\a\27\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\28\0003\a\29\0\18\b\2\0B\3\5\1K\0\1\0\0\15<leader>ff\15references\agr\16code_action\15<leader>ca\vrename\15<leader>rn\20type_definition\14<leader>D\0\15<leader>wl\28remove_workspace_folder\15<leader>wr\25add_workspace_folder\15<leader>wa\nhover\6K\19implementation\agi\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\0ƒ\1\0\1\6\0\t\0\0145\1\b\0005\2\5\0006\3\1\0'\5\2\0B\3\2\0029\3\3\0039\3\4\3B\3\1\2=\3\4\0025\3\6\0=\3\a\2=\2\3\1=\1\0\0K\0\1\0\1\0\0\rvalidate\1\0\1\venable\2\1\0\0\fschemas\tjson\16schemastore\frequire\rsettings—\6\1\0\15\0&\0^5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0006\5\1\0009\5\6\0059\5\a\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\b\0006\5\1\0009\5\6\0059\5\t\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\n\0006\5\1\0009\5\6\0059\5\v\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0006\5\1\0009\5\6\0059\5\r\5\18\6\0\0B\1\5\0013\1\14\0006\2\15\0'\4\16\0B\2\2\0029\3\17\0025\5\18\0005\6\20\0005\a\19\0=\a\21\6=\6\22\5B\3\2\0015\3\24\0003\4\23\0=\4\25\0036\4\1\0009\4\26\0049\4\27\0049\4\28\4B\4\1\0026\5\15\0'\a\29\0B\5\2\0029\5\30\5\18\a\4\0B\5\2\2\18\4\5\0006\5\15\0'\a\31\0B\5\2\0026\6 \0009\b!\2B\b\1\0A\6\0\4X\t\16€5\v\"\0=\1#\v=\4$\v9\f%\n8\f\f\3\15\0\f\0X\r\4€9\f%\n8\f\f\3\18\14\v\0B\f\2\0019\f%\n8\f\f\0059\f\17\f\18\14\v\0B\f\2\1E\t\3\3R\tîK\0\1\0\tname\17capabilities\14on_attach\1\0\0\26get_installed_servers\vipairs\14lspconfig\25default_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\vjsonls\1\0\0\0\aui\nicons\1\0\0\1\0\3\19server_pending\bâžœ\23server_uninstalled\bâœ—\21server_installed\bâœ“\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0\15setloclist\14<leader>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\14<leader>e\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÁ\1\0\0\5\0\v\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\1K\0\1\0\26:NvimTreeFindFile<CR>\n<C-n>\24:NvimTreeToggle<CR>\21<leader><leader>\6n\bset\vkeymap\bvim\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nè\5\0\0\6\0\29\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\b\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\3=\3\26\0025\3\27\0=\3\28\2B\0\2\1K\0\1\0\fendwise\1\0\1\venable\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[F\20@function.outer\a[C\17@class.outer\24goto_previous_start\1\0\2\a[c\17@class.outer\a[f\20@function.outer\18goto_next_end\1\0\2\a]F\20@function.outer\a]C\17@class.outer\20goto_next_start\1\0\2\a]c\17@class.outer\a]f\20@function.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\1\0\4\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\vindent\1\0\1\fdisable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\19init_selection\bgnn\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n¹\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\rpatterns\1\0\0\tjson\1\3\0\0\vobject\tpair\tyaml\1\3\0\0\23block_mapping_pair\24block_sequence_item\truby\1\3\0\0\vmodule\nblock\15javascript\1\3\0\0\vobject\tpair\fdefault\1\0\0\1\n\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\telse\vswitch\tcase\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n`\0\0\4\1\5\0\t6\0\0\0009\0\1\0B\0\1\2-\1\0\0009\1\2\0015\3\3\0=\0\4\3B\1\2\1K\0\1\0\0À\17default_text\1\0\0\14live_grep\25get_visual_selection\bvimp\0\0\4\1\5\0\t6\0\0\0009\0\1\0B\0\1\2-\1\0\0009\1\2\0015\3\3\0=\0\4\3B\1\2\1K\0\1\0\0À\17default_text\1\0\0\30current_buffer_fuzzy_find\25get_visual_selection\bvim{\0\0\6\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2=\3\b\2B\0\2\1K\0\1\0\vsearch\1\0\0\a> \ninput\afn\bvim\16grep_string\22telescope.builtin\frequireb\0\0\4\1\5\0\t6\0\0\0009\0\1\0B\0\1\2-\1\0\0009\1\2\0015\3\3\0=\0\4\3B\1\2\1K\0\1\0\0À\17default_text\1\0\0\16grep_string\25get_visual_selection\bvimÊ\n\1\0\6\0.\0–\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\n\0'\5\v\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\f\0'\5\r\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0'\5\15\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\16\0'\5\17\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\18\0'\5\19\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0'\5\21\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\22\0'\5\23\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\24\0'\5\25\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\26\0'\5\27\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\28\0'\5\29\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\30\0'\5\31\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4 \0'\5!\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\"\0'\5#\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4$\0'\5%\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3&\0'\4$\0003\5'\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4(\0'\5)\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3&\0'\4(\0003\5*\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4+\0003\5,\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3&\0'\4+\0003\5-\0B\1\4\0012\0\0€K\0\1\0\0\0\15<leader>ts\0001<Cmd>Telescope current_buffer_fuzzy_find<CR>\14<leader>b\0\6v!<Cmd>Telescope live_grep<CR>\n<C-m>-<Cmd>Telescope lsp_workspace_symbols<CR>\15<leader>tw,<Cmd>Telescope lsp_document_symbols<CR>\15<leader>to#<Cmd>Telescope diagnostics<CR>\15<leader>td!<Cmd>Telescope git_stash<CR>\16<leader>tgh\"<Cmd>Telescope git_status<CR>\n<C-g>$<Cmd>Telescope git_branches<CR>\16<leader>tgb$<Cmd>Telescope git_bcommits<CR>\16<leader>tgx#<Cmd>Telescope git_commits<CR>\16<leader>tgc <Cmd>Telescope oldfiles<CR>\15<leader>tc\"<Cmd>Telescope find_files<CR>\n<C-f>\30<Cmd>Telescope resume<CR>\15<leader>tt\31<Cmd>Telescope buffers<CR>\n<C-b>!<Cmd>Telescope man_pages<CR>\16<leader>thm!<Cmd>Telescope help_tags<CR>\16<leader>thh\6n\bset\vkeymap\bvim\22telescope.builtin\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-slim"] = {
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/vim-slim",
    url = "https://github.com/slim-template/vim-slim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/alex/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nd\0\0\6\0\6\0\v6\0\0\0006\2\1\0009\2\2\0026\4\1\0009\4\3\0049\4\4\0049\4\5\4B\4\1\0A\2\0\0A\0\0\1K\0\1\0\27list_workspace_folders\bbuf\blsp\finspect\bvim\nprint@\0\0\3\0\5\0\a6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0B\0\2\1K\0\1\0\1\0\1\nasync\2\vformat\bbuf\blsp\bvim×\5\1\2\t\0\30\0v5\2\0\0=\1\1\0026\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\6\0006\a\2\0009\a\a\a9\a\b\a9\a\t\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\n\0006\a\2\0009\a\a\a9\a\b\a9\a\v\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\f\0006\a\2\0009\a\a\a9\a\b\a9\a\r\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\14\0006\a\2\0009\a\a\a9\a\b\a9\a\15\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\16\0006\a\2\0009\a\a\a9\a\b\a9\a\17\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\18\0003\a\19\0\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\20\0006\a\2\0009\a\a\a9\a\b\a9\a\21\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\22\0006\a\2\0009\a\a\a9\a\b\a9\a\23\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\24\0006\a\2\0009\a\a\a9\a\b\a9\a\25\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\26\0006\a\2\0009\a\a\a9\a\b\a9\a\27\a\18\b\2\0B\3\5\0016\3\2\0009\3\3\0039\3\4\3'\5\5\0'\6\28\0003\a\29\0\18\b\2\0B\3\5\1K\0\1\0\0\15<leader>ff\15references\agr\16code_action\15<leader>ca\vrename\15<leader>rn\20type_definition\14<leader>D\0\15<leader>wl\28remove_workspace_folder\15<leader>wr\25add_workspace_folder\15<leader>wa\nhover\6K\19implementation\agi\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\vbuffer\1\0\0ƒ\1\0\1\6\0\t\0\0145\1\b\0005\2\5\0006\3\1\0'\5\2\0B\3\2\0029\3\3\0039\3\4\3B\3\1\2=\3\4\0025\3\6\0=\3\a\2=\2\3\1=\1\0\0K\0\1\0\1\0\0\rvalidate\1\0\1\venable\2\1\0\0\fschemas\tjson\16schemastore\frequire\rsettings—\6\1\0\15\0&\0^5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0006\5\1\0009\5\6\0059\5\a\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\b\0006\5\1\0009\5\6\0059\5\t\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\n\0006\5\1\0009\5\6\0059\5\v\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0006\5\1\0009\5\6\0059\5\r\5\18\6\0\0B\1\5\0013\1\14\0006\2\15\0'\4\16\0B\2\2\0029\3\17\0025\5\18\0005\6\20\0005\a\19\0=\a\21\6=\6\22\5B\3\2\0015\3\24\0003\4\23\0=\4\25\0036\4\1\0009\4\26\0049\4\27\0049\4\28\4B\4\1\0026\5\15\0'\a\29\0B\5\2\0029\5\30\5\18\a\4\0B\5\2\2\18\4\5\0006\5\15\0'\a\31\0B\5\2\0026\6 \0009\b!\2B\b\1\0A\6\0\4X\t\16€5\v\"\0=\1#\v=\4$\v9\f%\n8\f\f\3\15\0\f\0X\r\4€9\f%\n8\f\f\3\18\14\v\0B\f\2\0019\f%\n8\f\f\0059\f\17\f\18\14\v\0B\f\2\1E\t\3\3R\tîK\0\1\0\tname\17capabilities\14on_attach\1\0\0\26get_installed_servers\vipairs\14lspconfig\25default_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\vjsonls\1\0\0\0\aui\nicons\1\0\0\1\0\3\19server_pending\bâžœ\23server_uninstalled\bâœ—\21server_installed\bâœ“\1\0\1\27automatic_installation\2\nsetup\23nvim-lsp-installer\frequire\0\15setloclist\14<leader>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\14<leader>e\6n\bset\vkeymap\bvim\1\0\2\vsilent\2\fnoremap\2\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\4\1\5\0\t6\0\0\0009\0\1\0B\0\1\2-\1\0\0009\1\2\0015\3\3\0=\0\4\3B\1\2\1K\0\1\0\0À\17default_text\1\0\0\14live_grep\25get_visual_selection\bvimp\0\0\4\1\5\0\t6\0\0\0009\0\1\0B\0\1\2-\1\0\0009\1\2\0015\3\3\0=\0\4\3B\1\2\1K\0\1\0\0À\17default_text\1\0\0\30current_buffer_fuzzy_find\25get_visual_selection\bvim{\0\0\6\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2=\3\b\2B\0\2\1K\0\1\0\vsearch\1\0\0\a> \ninput\afn\bvim\16grep_string\22telescope.builtin\frequireb\0\0\4\1\5\0\t6\0\0\0009\0\1\0B\0\1\2-\1\0\0009\1\2\0015\3\3\0=\0\4\3B\1\2\1K\0\1\0\0À\17default_text\1\0\0\16grep_string\25get_visual_selection\bvimÊ\n\1\0\6\0.\0–\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\n\0'\5\v\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\f\0'\5\r\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0'\5\15\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\16\0'\5\17\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\18\0'\5\19\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0'\5\21\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\22\0'\5\23\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\24\0'\5\25\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\26\0'\5\27\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\28\0'\5\29\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\30\0'\5\31\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4 \0'\5!\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\"\0'\5#\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4$\0'\5%\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3&\0'\4$\0003\5'\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4(\0'\5)\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3&\0'\4(\0003\5*\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4+\0003\5,\0B\1\4\0016\1\4\0009\1\5\0019\1\6\1'\3&\0'\4+\0003\5-\0B\1\4\0012\0\0€K\0\1\0\0\0\15<leader>ts\0001<Cmd>Telescope current_buffer_fuzzy_find<CR>\14<leader>b\0\6v!<Cmd>Telescope live_grep<CR>\n<C-m>-<Cmd>Telescope lsp_workspace_symbols<CR>\15<leader>tw,<Cmd>Telescope lsp_document_symbols<CR>\15<leader>to#<Cmd>Telescope diagnostics<CR>\15<leader>td!<Cmd>Telescope git_stash<CR>\16<leader>tgh\"<Cmd>Telescope git_status<CR>\n<C-g>$<Cmd>Telescope git_branches<CR>\16<leader>tgb$<Cmd>Telescope git_bcommits<CR>\16<leader>tgx#<Cmd>Telescope git_commits<CR>\16<leader>tgc <Cmd>Telescope oldfiles<CR>\15<leader>tc\"<Cmd>Telescope find_files<CR>\n<C-f>\30<Cmd>Telescope resume<CR>\15<leader>tt\31<Cmd>Telescope buffers<CR>\n<C-b>!<Cmd>Telescope man_pages<CR>\16<leader>thm!<Cmd>Telescope help_tags<CR>\16<leader>thh\6n\bset\vkeymap\bvim\22telescope.builtin\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n®\5\0\0\5\0\"\0D6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\20\0'\4\21\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\22\0'\4\23\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\24\0'\4\25\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\26\0'\4\27\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\28\0'\4\29\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\30\0'\4\31\0B\0\4\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3 \0'\4!\0B\0\4\1K\0\1\0 <Cmd>Gitsigns prev_hunk<CR>\a[g <Cmd>Gitsigns next_hunk<CR>\a]g!<Cmd>Gitsigns blame_line<CR>\15<leader>gb!<Cmd>Gitsigns reset_hunk<CR>\15<leader>gr!<Cmd>Gitsigns stage_hunk<CR>\15<leader>gs#<Cmd>Gitsigns preview_hunk<CR>\15<leader>gh\31<Cmd>Gitsigns diffthis<CR>\15<leader>gd\6n\bset\vkeymap\bvim\nsigns\1\0\0\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\bâ€¾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\6~\badd\1\0\0\1\0\1\ttext\6+\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\5\0\v\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0B\0\4\1K\0\1\0\26:NvimTreeFindFile<CR>\n<C-n>\24:NvimTreeToggle<CR>\21<leader><leader>\6n\bset\vkeymap\bvim\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nè\5\0\0\6\0\29\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\b\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\3=\3\26\0025\3\27\0=\3\28\2B\0\2\1K\0\1\0\fendwise\1\0\1\venable\2\16textobjects\tmove\22goto_previous_end\1\0\2\a[F\20@function.outer\a[C\17@class.outer\24goto_previous_start\1\0\2\a[c\17@class.outer\a[f\20@function.outer\18goto_next_end\1\0\2\a]F\20@function.outer\a]C\17@class.outer\20goto_next_start\1\0\2\a]c\17@class.outer\a]f\20@function.outer\1\0\2\venable\2\14set_jumps\2\vselect\1\0\0\1\0\4\aac\17@class.outer\aic\17@class.inner\aif\20@function.inner\aaf\20@function.outer\1\0\2\14lookahead\2\venable\2\vindent\1\0\1\fdisable\2\26incremental_selection\fkeymaps\1\0\4\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\19init_selection\bgnn\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n¹\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\2B\0\2\1K\0\1\0\rpatterns\1\0\0\tjson\1\3\0\0\vobject\tpair\tyaml\1\3\0\0\23block_mapping_pair\24block_sequence_item\truby\1\3\0\0\vmodule\nblock\15javascript\1\3\0\0\vobject\tpair\fdefault\1\0\0\1\n\0\0\nclass\rfunction\vmethod\bfor\nwhile\aif\telse\vswitch\tcase\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: auto-save.nvim
time([[Config for auto-save.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14auto-save\frequire\0", "config", "auto-save.nvim")
time([[Config for auto-save.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expand.\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\19nvim_list_bufs\bapi\bvimÓ\5\1\0\r\0)\0\\6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0049\5\t\0009\5\n\0059\5\v\0055\a\r\0009\b\t\0009\b\f\b)\nþÿB\b\2\2=\b\14\a9\b\t\0009\b\f\b)\n\2\0B\b\2\2=\b\15\a9\b\t\0009\b\16\bB\b\1\2=\b\17\a9\b\t\0009\b\18\b5\n\21\0009\v\19\0009\v\20\v=\v\22\nB\b\2\2=\b\23\aB\5\2\2=\5\t\0044\5\4\0005\6\24\0>\6\1\0055\6\25\0005\a\27\0003\b\26\0=\b\28\a=\a\29\6>\6\2\0055\6\30\0>\6\3\5=\5\31\4B\2\2\0019\2\3\0009\2 \2'\4!\0005\5\"\0009\6\t\0009\6\n\0069\6 \6B\6\1\2=\6\t\0059\6#\0009\6\31\0064\b\3\0005\t$\0>\t\1\bB\6\2\2=\6\31\5B\2\3\0016\2%\0005\4&\0B\2\2\4X\5\14€9\a\3\0009\a \a\18\t\6\0005\n'\0009\v\t\0009\v\n\v9\v \vB\v\1\2=\v\t\n4\v\3\0005\f(\0>\f\1\v=\v\31\nB\a\3\1E\5\3\3R\5ð2\0\0€K\0\1\0\1\0\2\tname\vbuffer\19max_item_count\3\n\1\0\0\1\3\0\0\6/\6?\vipairs\1\0\1\tname\fcmdline\vconfig\1\0\0\6:\fcmdline\fsources\1\0\1\tname\tpath\voption\15get_bufnrs\1\0\1\20keyword_pattern\t\\k\\+\0\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nabort\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim
time([[Config for nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\0\3\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0'\1\6\0=\1\5\0006\0\3\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd\14macchiato\23catppuccin_flavour\6g\bvim\nsetup\15catppuccin\frequire\0", "config", "nvim")
time([[Config for nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

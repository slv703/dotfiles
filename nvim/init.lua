-----------------------------------------------------------
-- # Settings
-----------------------------------------------------------

-- ## Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- ## Show some lines after cursor
vim.opt.scrolloff = 5
-- ## Use system clipboard
vim.opt.clipboard = "unnamedplus"
-- ## Spell dictionaries
vim.opt.spelllang = { 'en_us', 'ru' }
-- ## Location of new vertical split
vim.opt.splitright = true
vim.opt.splitbelow = true
-- ## Undo after rebooting
vim.opt.undofile = true
-- ## Term colors
vim.opt.termguicolors = true
-- ## Highlight current line
vim.opt.cursorline = true
-- ## Faster auto-completion and etc
vim.opt.updatetime = 50
-- ## Sign clolum
vim.opt.signcolumn = 'auto:1-2'
-- ## show trailing whitespaces, tabs
vim.opt.list = true
vim.opt.listchars = { tab = '▸▸', trail = '•', nbsp = '␣', extends = '…' }

-----------------------------------------------------------
-- # Mappinngs
-----------------------------------------------------------

-- ## Space as <leader>
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- ## Turn off highlight after search
vim.keymap.set('n', '//', ':nohlsearch<CR>')
-- ## Edit/source current config
vim.keymap.set('n', '<leader>vl', ':vsp $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>vs', ':source $MYVIMRC<CR>')
-- ## Switch layout
vim.keymap.set('i', '<C-j>', '<C-^>')
vim.keymap.set('n', '<C-0>', ':bnext<CR>')
vim.keymap.set('n', '<C-9>', ':bprevious<CR>')
-- ## Change without yanking
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("v", "c", '"_c')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("v", "C", '"_C')

-----------------------------------------------------------
-- # Commands
-----------------------------------------------------------

-- ## Git

-- ### Git log current file with range(optional)
vim.api.nvim_create_user_command(
  "GitLog",
  function(opts)
    local range = (opts.range == 0 and opts.args) or (opts.line1 .. [[,]] .. opts.line2)
    if range == "" then
      vim.cmd([[vsplit term://git --no-pager log -p --stat --follow ]] .. [[%]])
    else
      vim.cmd([[vsplit term://git --no-pager log -p -L]] .. range .. [[:%]])
    end
  end,
  { nargs = "?", range = true }
)
vim.keymap.set("n", "<leader>gl", "<Cmd>GitLog<CR>")
vim.keymap.set("v", "<leader>gl", "<Cmd>'<,'>GitLog<CR>")

-- ### Git show commit hash
vim.api.nvim_create_user_command(
  "GitShow",
  function(opts)
    local commit_hash = opts.args
    if commit_hash == "" then
      local cword = vim.fn.expand("<cword>")
      vim.cmd([[vsplit term://git --no-pager show -p --stat ]] .. cword)
    else
      vim.cmd([[vsplit term://git --no-pager show -p --stat ]] .. commit_hash)
    end
  end,
  { nargs = "?" }
)
vim.keymap.set("n", "<leader>gi", "<Cmd>GitShow<CR>")

-----------------------------------------------------------
-- # Autocommands
-----------------------------------------------------------

-- ## Highlight yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end
})

-----------------------------------------------------------
-- # Plugins
-----------------------------------------------------------

require('packer').startup {
  function(use)
    use { 'wbthomason/packer.nvim' }

    -----------------------------------------------------------
    -- ## UI
    -----------------------------------------------------------

    -- ### Icons
    use {
      'kyazdani42/nvim-web-devicons',
      config = function()
        require('nvim-web-devicons').setup()
      end
    }

    -- ### Theme
    use {
      'catppuccin/nvim',
      config = function()
        require('catppuccin').setup()
        vim.g.catppuccin_flavour = 'macchiato'
        vim.cmd [[colorscheme catppuccin]]
      end
    }

    -- ### Fancy lower statusline
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('lualine').setup()
      end
    }

    -- ### Displaying indents
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('indent_blankline').setup()
      end
    }

    -----------------------------------------------------------
    -- ## Git
    -----------------------------------------------------------

    -- ## Git decorations and buffer integration
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup({
          signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" }
          }
        })

        -- ## Mappings
        vim.keymap.set("n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>")
        vim.keymap.set("n", "<leader>gh", "<Cmd>Gitsigns preview_hunk<CR>")
        vim.keymap.set("n", "<leader>gs", "<Cmd>Gitsigns stage_hunk<CR>")
        vim.keymap.set("n", "<leader>gr", "<Cmd>Gitsigns reset_hunk<CR>")
        vim.keymap.set("n", "<leader>gb", "<Cmd>Gitsigns blame_line<CR>")
        vim.keymap.set("n", "]g", "<Cmd>Gitsigns next_hunk<CR>")
        vim.keymap.set("n", "[g", "<Cmd>Gitsigns prev_hunk<CR>")
      end
    })

    -----------------------------------------------------------
    -- ## Telescope
    -----------------------------------------------------------

    -- ### Fuzzy finder over lists
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').setup()
        local t = require('telescope.builtin')

        -- ### Mappings
        vim.keymap.set("n", "<leader>thh", "<Cmd>Telescope help_tags<CR>")
        vim.keymap.set("n", "<leader>thm", "<Cmd>Telescope man_pages<CR>")

        vim.keymap.set("n", "<C-b>", "<Cmd>Telescope buffers<CR>")
        vim.keymap.set("n", "<leader>tt", "<Cmd>Telescope resume<CR>")

        vim.keymap.set("n", "<C-f>", "<Cmd>Telescope find_files<CR>")
        vim.keymap.set("n", "<leader>tc", "<Cmd>Telescope oldfiles<CR>")

        vim.keymap.set("n", "<leader>tgc", "<Cmd>Telescope git_commits<CR>")
        vim.keymap.set("n", "<leader>tgx", "<Cmd>Telescope git_bcommits<CR>")
        vim.keymap.set("n", "<leader>tgb", "<Cmd>Telescope git_branches<CR>")
        vim.keymap.set("n", "<C-g>", "<Cmd>Telescope git_status<CR>")
        vim.keymap.set("n", "<leader>tgh", "<Cmd>Telescope git_stash<CR>")

        vim.keymap.set("n", "<leader>td", "<Cmd>Telescope diagnostics<CR>")
        vim.keymap.set("n", "<leader>to", "<Cmd>Telescope lsp_document_symbols<CR>")
        vim.keymap.set("n", "<leader>tw", "<Cmd>Telescope lsp_workspace_symbols<CR>")

        vim.keymap.set("n", "<C-m>", "<Cmd>Telescope live_grep<CR>")
        vim.keymap.set("v", "<C-m>", function()
          local text = vim.get_visual_selection()
          t.live_grep({ default_text = text })
        end)

        vim.keymap.set("n", "<leader>b", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
        vim.keymap.set("v", "<leader>b", function()
          local text = vim.get_visual_selection()
          t.current_buffer_fuzzy_find({ default_text = text })
        end)

        vim.keymap.set("n", "<leader>ts", function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("> ") })
          end)
        vim.keymap.set("v", "<leader>ts", function()
          local text = vim.get_visual_selection()
          t.grep_string({ default_text = text })
        end)
      end
    }

    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
      requires = { 'nvim-telescope/telescope.nvim' },
      config = function()
        require('telescope').load_extension('fzf')
      end
    }

    -----------------------------------------------------------
    -- ## Treesitter
    -----------------------------------------------------------

    use {
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
          require('treesitter-context').setup({
            patterns = {
              default = {
                'class',
                'function',
                'method',
                'for',
                'while',
                'if',
                'else',
                'switch',
                'case',
              },
              javascript = {
                'object',
                'pair',
              },
              ruby = {
                'module',
                'block'
              },
              yaml = {
                'block_mapping_pair',
                'block_sequence_item',
              },
              json = {
                'object',
                'pair',
              },
            },
          })
        end
      },
      { 'RRethy/nvim-treesitter-endwise' },
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      requires = { 'nvim-treesitter/nvim-treesitter' }
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
      end,
      config = function()
        require('nvim-treesitter.configs').setup {
          auto_install = true,
          highlight = { enable = true },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = 'gnn',
              node_incremental = 'grn',
              scope_incremental = 'grc',
              node_decremental = 'grm',
            }
          },
          indent = {
            disable = true,
          },
          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ['af'] = '@function.outer', ['if'] = '@function.inner', ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
              }
            },
            move = {
              enable = true,
              set_jumps = true,
              goto_next_start = {
                [']f'] = '@function.outer',
                [']c'] = '@class.outer',
              },
              goto_next_end = {
                [']F'] = '@function.outer',
                [']C'] = '@class.outer',
              },
              goto_previous_start = {
                ['[f'] = '@function.outer',
                ['[c'] = '@class.outer',
              },
              goto_previous_end = {
                ['[F'] = '@function.outer',
                ['[C'] = '@class.outer',
              },
            },
          },
          endwise = {
            enable = true
          }
        }
      end
    }

    -----------------------------------------------------------
    -- ## LSP
    -----------------------------------------------------------

    -- Prepare sources and snippet engine for autocompletion
    use {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      requires = { 'hrsh7th/nvim-cmp' }
    }

    -- ### Autocompletion
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup {
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          -- ### Mappings
          mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-2),
            ['<C-f>'] = cmp.mapping.scroll_docs(2),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true
            }
          }),
          sources = {
            { name = 'nvim_lsp' },
            {
              name = 'buffer',
              option = {
                get_bufnrs = function()
                  return vim.api.nvim_list_bufs()
                end,
                keyword_pattern = [[\k\+]],
              },
            },
            { name = 'path' },
          }
        }

        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources {
            { name = 'cmdline' },
          },
        })

        for _, cmd_type in ipairs({ '/', '?', }) do
          cmp.setup.cmdline(cmd_type, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer', max_item_count = 10 },
            },
          })
        end
      end
    }

    -- ### LSP config and installer
    use {
      'williamboman/nvim-lsp-installer',
      'b0o/schemastore.nvim',
      {
        'neovim/nvim-lspconfig',
        config = function()
          -- ### Diagnositc mappings
          local keymap_opts = { noremap = true, silent = true }
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, keymap_opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, keymap_opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, keymap_opts)
          vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, keymap_opts)

          -- ### Mappings
          local on_attach = function(_, bufnr)
            local bufopts = { buffer = bufnr }
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            vim.keymap.set('n', '<leader>wl', function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, bufopts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader>ff', function()
              vim.lsp.buf.format({ async = true })
            end, bufopts)
          end

          -- ### LSP installer configuration
          local lsp_installer = require('nvim-lsp-installer')
          lsp_installer.setup {
            automatic_installation = true,
            ui = {
              icons = {
                server_installed = '✓',
                server_pending = '➜',
                server_uninstalled = '✗'
              }
            }
          }

          -- ### Additional settings for certain LSP servers
          local enhance_server_opts = {
            ['jsonls'] = function(options)
              options.settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              }
            end,
          }

          -- ### Autocompletion capabilities
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

          local lspconfig = require('lspconfig')
          for _, server in ipairs(lsp_installer.get_installed_servers()) do
            -- ### LSP servers configuration
            local lsp_opts = {
              on_attach = on_attach,
              capabilities = capabilities,
            }
            if enhance_server_opts[server.name] then
              enhance_server_opts[server.name](lsp_opts)
            end
            lspconfig[server.name].setup(lsp_opts)
          end
        end
      }
    }

    -----------------------------------------------------------
    -- ## Other
    -----------------------------------------------------------

    -- ### File explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require('nvim-tree').setup()

        -- #### Mappinngs
        vim.keymap.set('n', '<leader><leader>', ':NvimTreeToggle<CR>')
        vim.keymap.set('n', '<C-n>', ':NvimTreeFindFile<CR>')
      end
    }

    -- ### Autosaving
    use {
      'Pocco81/auto-save.nvim',
      config = function()
        require('auto-save').setup() 
      end
    }

    -- ### Popup with suggestions to complete a key binding
    use {
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup()
      end
    }

    -- ### Indentation style detection
    use {
      'nmac427/guess-indent.nvim',
      config = function()
        require('guess-indent').setup()
      end
    }

    -- ### Comment lines with shortcuts
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    -- ### Text editing
    use {
      'kylechui/nvim-surround',
      config = function()
        require('nvim-surround').setup()
      end
    }

    -----------------------------------------------------------
    -- ## Language specific plugins
    -----------------------------------------------------------

    -- ### Markdown
    use({
      'iamcco/markdown-preview.nvim',
      run = function()
        vim.fn['mkdp#util#install']()
      end
    })

    -- ### Ruby
    use { 'slim-template/vim-slim' }
  end,
  config = {
    snapshot_path = require('packer.util').join_paths(vim.fn.getenv('HOME'), 'dotfiles', 'nvim'),
    display = {
      open_fn = require('packer.util').float,
      log = { level = 'warn' },
    }
  }
}

-- vim: ts=2 sts=2 sw=2 et

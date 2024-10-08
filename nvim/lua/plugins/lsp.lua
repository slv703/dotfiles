return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "folke/neodev.nvim", opts = {} },
            -- Package manager
            {
                "williamboman/mason.nvim",
                config = function()
                    require("mason").setup()

                    require("mason-lspconfig").setup({
                        ensure_installed = {
                            "solargraph"
                        },
                    })
                end,
                cmd = "Mason",
            },
            { "williamboman/mason-lspconfig.nvim" },
            -- JSON schemas
            { "b0o/schemastore.nvim" },
        },
        keys = {
          { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true } },
          { "<leader>gg", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true } },
        },
        opts = {
            diagnostics = {
                config = {
                    virtual_text = false,
                    update_in_insert = false,
                    underline = true,
                    severity_sort = true,
                    float = {
                        source = "always",
                    },
                },
                signs = {
                    DiagnosticSignError = { text = " ", texthl = "DiagnosticSignError" },
                    DiagnosticSignWarn = { text = " ", texthl = "DiagnosticSignWarn" },
                    DiagnosticSignInfo = { text = " ", texthl = "DiagnosticSignInfo" },
                    DiagnosticSignHint = { text = " ", texthl = "DiagnosticSignHint" },
                },
            },

            on_attach = function(client, bufnr)
                k.lsp(bufnr, client)
            end,
            servers = {
                jsonls = function(options, _)
                    options.settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                        },
                    }
                end,
                yamlls = function(options, _)
                    options.settings = {
                        yaml = {
                            schemas = require("schemastore").yaml.schemas(),
                            keyOrdering = false,
                        },
                    }
                end,
                solargraph = function(options, opts)
                    opts.settings = {
                        solargraph = {
                            diagnostics = false,
                        },
                    }

                    options.on_attach = function(client, bufnr)
                        opts.on_attach(client, bufnr)
                    end
                end,
                lua_ls = function(_, _)
                    require("neodev").setup()
                end,
                gopls = function(options)
                    options.settings = {
                        gopls = {
                            gofumpt = true,
                            codelenses = {
                                gc_details = false,
                                generate = true,
                                regenerate_cgo = true,
                                run_govulncheck = true,
                                test = true,
                                tidy = true,
                                upgrade_dependency = true,
                                vendor = true,
                            },
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                compositeLiteralTypes = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                            analyses = {
                                -- fieldalignment = true,
                                nilness = true,
                                unusedparams = true,
                                unusedwrite = true,
                                useany = true,
                            },
                            usePlaceholders = true,
                            completeUnimported = true,
                            staticcheck = true,
                            directoryFilters = { "-.git", "-node_modules" },
                            semanticTokens = true,
                        },
                    }
                end,
            },
        },
        config = function(_, opts)
            for sign, value in pairs(opts.diagnostics.signs) do
                vim.fn.sign_define(sign, value)
            end
            vim.diagnostic.config(opts.diagnostics.config)

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            for _, server_name in ipairs(require("mason-lspconfig").get_installed_servers()) do
                local lsp_opts = {
                    on_attach = opts.on_attach,
                    capabilities = capabilities,
                }

                if opts.servers[server_name] then
                    opts.servers[server_name](lsp_opts, opts)
                end

                lspconfig[server_name].setup(lsp_opts)
            end
        end,
    },
}


return {
    'neovim/nvim-lspconfig',
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    config = function()
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                enable = true,
                text = {
                    ["ERROR"] = signs.Error,
                    ["WARN"] = signs.Warn,
                    ["HINT"] = signs.Hint,
                    ["INFO"] = signs.Info,
                },
                texthl = {
                    ["ERROR"] = "DiagnosticDefault",
                    ["WARN"] = "DiagnosticDefault",
                    ["HINT"] = "DiagnosticDefault",
                    ["INFO"] = "DiagnosticDefault",
                },
                numhl = {
                    ["ERROR"] = "DiagnosticDefault",
                    ["WARN"] = "DiagnosticDefault",
                    ["HINT"] = "DiagnosticDefault",
                    ["INFO"] = "DiagnosticDefault",
                },
                severity_sort = true,
            },
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.resolveSupport = {
          properties = { "documentation", "detail", "additionalTextEdits" },
        }

        require('lspconfig').pyright.setup({  capabilities= capabilities, settings = { pyright = { autoImportCompletion = true, }, python = { analysis = { autoSearchPaths = true, diagnosticMode = 'openFilesOnly', useLibraryCodeForTypes = true, typeCheckingMode = 'off' } } } })

        require('lspconfig').lua_ls.setup({
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                })
            end,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            },

            capabilities = capabilities,
        })

        require("lspconfig").clangd.setup({ capabilities = capabilities })

        -- require("lspconfig").ts_ls.setup({
        --   init_options = {
        --     plugins = {
        --       {
        --         name = "@vue/typescript-plugin",
        --         location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        --         languages = {"javascript", "typescript", "vue"},
        --       },
        --     },
        --   },
        --   filetypes = {
        --     "javascript",
        --     "typescript",
        --     "typescriptreact",
        --     "vue",
        --   },
        -- })

        require('lspconfig').emmet_language_server.setup({ capabilities = capabilities })

        require("lspconfig").eslint.setup({ flags = {
            allow_incremental_sync = false,
            debounce_text_changes = 1000,
          },
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        })
    end
}

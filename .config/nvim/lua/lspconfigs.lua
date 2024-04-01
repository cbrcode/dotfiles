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

require('lspconfig').emmet_language_server.setup({ capabilities = capabilities })

require('lspconfig').lua_ls.setup({
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
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

-- require('lspconfig').rust_analyzer.setup({
--     on_attach = function(client, bufnr)
--         vim.lsp.inlay_hint.enable(bufnr)
--     end
-- })
--
-- local rt = require("rust-tools")
--
-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })

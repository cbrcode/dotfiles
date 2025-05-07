return {
    'hrsh7th/nvim-cmp',
    event='InsertEnter',
    dependencies={
         'hrsh7th/cmp-nvim-lsp',
         'hrsh7th/cmp-nvim-lua',
         'hrsh7th/cmp-buffer',
         'hrsh7th/cmp-path',
         'hrsh7th/cmp-cmdline',
         'saadparwaiz1/cmp_luasnip',
         'L3MON4D3/LuaSnip',
         'onsails/lspkind.nvim',
         'rafamadriz/friendly-snippets'
    },
    config = function()
        local cmp = require("cmp")
        if not cmp then
            return
        end

        local lspkind = require('lspkind')
        cmp.setup {
            formatting = {
                -- Youtube: How to set up nice formatting for your sources.
                format = lspkind.cmp_format {
                  mode = "symbol_text",
                  -- TODO: Think about this, except it's not centered :'(
                  -- symbol_map = {
                  --   Cody = "",
                  -- },
                  menu = {
                    buffer = "[buf]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[api]",
                    path = "[path]",
                    luasnip = "[snip]",
                    gh_issues = "[issues]",
                    tn = "[TabNine]",
                    eruby = "[erb]",
                  },
                },
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            mapping = {
              ["<C-p>"] = cmp.mapping.select_prev_item(),
              ["<C-n>"] = cmp.mapping.select_next_item(),
              ["<C-d>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-e>"] = cmp.mapping.close(),
              ["<CR>"] = cmp.mapping.confirm({
                 behavior = cmp.ConfirmBehavior.Replace,
                 select = false,
              }),
              ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
              ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
            },

            sources = cmp.config.sources({
                { name = 'nvim_lua' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'path' },
                { name  = 'buffer', keyword_length = 5 },
            }),

            experimental = {
                ghost_text = false,
            }
        }

        local pairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
        if not pairs_ok then
            return
        end

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}

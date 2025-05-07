local plugins = {
    { "loctvl842/monokai-pro.nvim", event='VeryLazy', config = function()
            require("monokai-pro").setup({
                filter = "ristretto",
                styles = {
                    --type = { italic = false }, -- (preferred) int, long, char, etc
                },
            })

            -- vim.cmd[[colorscheme monokai-pro]]
        end,
    },

    -- {
    --     'sainnhe/gruvbox-material', config = function()
    --         vim.g.gruvbox_material_foreground = 'original'
    --         vim.g.gruvbox_material_background = 'medium'
    --         vim.cmd[[colorscheme gruvbox-material]] 
    --     end,
    -- },

    -- {
    --     'ellisonleao/gruvbox.nvim', config = function()
    --         vim.cmd[[colorscheme gruvbox]]
    --     end,
    -- },

    { 'gruvbox-community/gruvbox', config = function()
            -- vim.cmd[[colorscheme gruvbox]]
        end
    },

    -- {
    --     'patstockwell/vim-monokai-tasty', config = function ()
    --         vim.cmd[[colorscheme vim-monokai-tasty]]
    --     end
    -- },

    {
        'NTBBloodbath/doom-one.nvim', config = function ()
            vim.g.doom_one_enable_treesitter = true
            vim.g.doom_one_telescope = true
            vim.g.indent_blankline = true

            -- vim.cmd[[colo doom-one]]
        end
    },

    -- {
    --     'VidocqH/auto-indent.nvim', opts = {},
    -- },

    -- {
    --     'rose-pine/neovim', config = function()
    --         require('rose-pine').setup({
    --             styles = { transparency = false },
    --         })
    --         vim.cmd[[colorscheme rose-pine]]
    --     end,
    -- },

    { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function()
            require('catppuccin').setup({
                flavour='mocha',
                -- transparent_background='false'
            })

            vim.cmd[[colo catppuccin]]
        end,
    },

    -- {
    --     'sainnhe/everforest', lazy=false, config = function()
    --         vim.g.everforest_background = 'hard'
    --         vim.cmd[[colorscheme everforest]]
    --     end,
    -- },

    { "nvim-treesitter/nvim-treesitter", config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "python", "c", "rust", "lua", "vim", "vimdoc", "query" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                -- List of parsers to ignore installing (or "all")
                --ignore_install = { "javascript" },

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                indent = {
                    enable = false,
                    disable = {},
                },

                highlight = {
                    enable = false,
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            })

            -- vim.cmd([[TSUpdate]])
        end,
    },

    "JoosepAlviste/nvim-ts-context-commentstring",

    { "numToStr/Comment.nvim", lazy = false, config = function()
        require('ts_context_commentstring').setup {
          enable_autocmd = false,
        }
        require('Comment').setup({
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
        end,
    },

    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },

    -- { "nvim-tree/nvim-web-devicons", lazy = false, tag = "nerd-v2-compat", config = function()
    --         require('nvim-web-devicons').setup()
    --     end,
    -- },
    --
    { 'nvim-telescope/telescope.nvim', lazy = true, branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- {
    --     'ms-jpq/coq_nvim', dependencies = { 'ms-jpq/coq.thirdparty' },
    -- },

    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
        lazy = false,
    },

    -- { "williamboman/mason-lspconfig.nvim",
    --     config = function()
    --         -- require('mason').setup()
    --         require("mason-lspconfig").setup()
    --     end,
    -- },

    {
        'williamboman/mason.nvim', config = function()
            require('mason').setup()
        end,
    },

    {
        "neovim/nvim-lspconfig", config = function()
            require('lspconfigs')
        end,
    },

    { 'hrsh7th/nvim-cmp', lazy = true, event="InsertEnter", dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip', 'onsails/lspkind.nvim', 'rafamadriz/friendly-snippets' }, config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            -- require('lspconfigs')
            require('completion')
        end,
    },

    {"lukas-reineke/indent-blankline.nvim", main="ibl", lazy=false, config = function()
            require('ibl').setup({
                indent = {
                    char = "▏"
                },
                scope = {
                    show_start = false,
                    show_end = false,
                },
            })
        end,
    },

    { 'folke/trouble.nvim', lazy = true,
        keys = {
            { "<leader>tr", ":TroubleToggle<CR>", desc='Trouble' },
            { "<leader>tq", ":TroubleToggle quickfix<CR>", desc='quickfix (Trouble)' },
            { "<leader>td", ":lua require('trouble').next({skip_groups = true, jump = true})<CR>" }
        },
        opts = {
            icons = false
        },
    },

    -- {
    --     'kkharji/lspsaga.nvim', lazy = true, event="InsertEnter",
    --     keys = {
    --         { "<leader>r", ":Lspsaga rename<CR>" },
    --         { "<leader>ca", ":Lspsaga code_action<CR>" },
    --         { "<leader>jd", ":Lspsaga diagnostic_jump_next<CR>" },
    --     },
    --     config = function()
    --         require("lspsaga").setup({
    --         })
    --     end,
    -- },

    -- {
    --     'b0o/incline.nvim', lazy=false, config = function()
    --         require("floatingtitles")
    --     end,
    -- },

    {
        'nvim-lualine/lualine.nvim',
        config = function ()
            require('statusline')
        end
    },

    
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        -- add any options here
        },
        dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        },
    },

    -- { 'simrat39/rust-tools.nvim' },

    -- {
    --     "sontungexpt/sttusline",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     event = { "BufEnter" },
    --     config = function(_, opts)
    --         require("sttusline").setup {
    --             -- statusline_color = "#000000",
    --             statusline_color = "#1e1e2e",
    --
    --             -- | 1 | 2 | 3
    --             -- recommended: 3
    --             laststatus = 3,
    --             disabled = {
    --                 filetypes = {
    --                     -- "NvimTree",
    --                     -- "lazy",
    --                 },
    --                 buftypes = {
    --                     -- "terminal",
    --                 },
    --             },
    --             components = {
    --                 "mode",
    --                 "filename",
    --                 "git-branch",
    --                 "git-diff",
    --                 "%=",
    --                 "diagnostics",
    --                 "copilot",
    --                 "encoding",
    --                 "pos-cursor",
    --                 "pos-cursor-progress",
    --             },
    --         }
    --     end,
    -- },

    {
        'barrett-ruth/live-server.nvim',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = function()
            require('live-server').setup({
                args = { '--port=3000', '--browser=explorer.exe' }
            })
        end
    },

    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        lazy = true,
        ft = 'norg',
        cmd = 'Neorg',
        -- tag = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
          require("neorg").setup {
            load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.concealer"] = {}, -- Adds pretty icons to your documents
              ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                  workspaces = {
                    notes = "~/notes",
                  },
                },
              },
            },
          }
        end,
    },

    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
    },
}

require("lazy").setup(plugins)

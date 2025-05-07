return { 'folke/trouble.nvim', lazy = true,
    keys = {
        { "<leader>tr", ":TroubleToggle<CR>", desc='Trouble' },
        { "<leader>tq", ":TroubleToggle quickfix<CR>", desc='quickfix (Trouble)' },
        { "<leader>td", ":lua require('trouble').next({skip_groups = true, jump = true})<CR>" }
    },
    opts = {
        icons = false
    },
}

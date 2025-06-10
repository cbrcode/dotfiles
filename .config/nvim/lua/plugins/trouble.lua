return { 'folke/trouble.nvim', lazy = true,
    version="3.6.0",
    keys = {
        { "<leader>tr", ":TroubleToggle<CR>", desc='Trouble' },
        { "<leader>tq", ":TroubleToggle quickfix<CR>", desc='quickfix (Trouble)' },
        { "<leader>td", ":lua require('trouble').next({skip_groups = true, jump = true})<CR>" }
    },
    opts = {
        icons = false
    },
}

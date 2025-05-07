return {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>o', '<cmd>Telescope find_files<CR>' },
        { '<leader>p', '<cmd>Telescope live_grep<CR>' },
        { '<leader><space>', '<cmd>Telescope buffers<CR>' },
        { '<leader>fh', '<cmd>Telescope help_tags<CR>' },
        { '<leader>fm', '<cmd>Telescope man_pages<CR>' },
        { '<leader>fc', '<cmd>Telescope colorscheme<CR>' },
    }
}

-- Leader Keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- leader f's
map('n', '<leader>fc', ':%bd<bar>q!<CR>')
map('n', '<leader>ft', ':NeoTreeFocusToggle<CR>')
map('n', '<leader>fk', ':NeoTreeFocus<CR>')

-- leader t's
map('n', '<leader>tr', ':TroubleToggle<CR>')

-- leader d's
map('n', '<leader>dx', ':Ex<CR>')
map('n', '<leader>dm', ':Mason<CR>')
map('n', '<leader>du', ':UndotreeToggle<CR>')
map('n', '<leader>da', ':AerialToggle<CR>')

--local Terminal  = require('toggleterm.terminal').Terminal
--local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", })
--
--function _lazygit_toggle()
--  lazygit:toggle()
--end
--
--map("n", "<leader>dg", "<cmd>lua _lazygit_toggle()<CR>", {})

-- leader n's
map('n', '<leader>nh', ':nohl<CR>')

-- leader z's
map('n', '<leader>z', ':ZenMode<CR>')

-- control +'s
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-L>', '<C-W><C-L>')

-- Telescope bindings
require('bindings.telescope')

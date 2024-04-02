local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('i', '<D-c>', '<Esc>') -- mac neovim binding

-- vim.api.nvim_set_keymap(, "p", ":lua trim()", { noremap = true})

-- leader f's
map('n', '<leader>fc', ':%bd<bar>q!<CR>')

-- leader t's
-- map('n', '<leader>tr', ':TroubleToggle<CR>')

-- leader d's
map('n', '<leader>dx', ':Ex<CR>')
map('n', '<leader>da', ':AerialToggle<CR>')
map('n', '<leader>dm', ':Mason<CR>')

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

-- control +'s
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-L>', '<C-W><C-L>')

-- window management
map('n', '<CR>', '<C-W>w')
map('n', '<leader>v', ':vs<CR>')
map('n', '<leader>s', ':sp<CR>')

-- Telescope binds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>o', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages)
vim.keymap.set('n', '<leader>fc', builtin.colorscheme)

-- LSP binds
map('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>')
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'go', ':lua vim.lsp.buf.type_definition()<CR>')
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
map('n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>lf', ':lua vim.lsp.buf.format({async=true})<CR>')
map('x', '<leader>lf', ':lua vim.lsp.buf.format({async=true})<CR>')

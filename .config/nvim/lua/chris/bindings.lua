local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('i', '<D-c>', '<C-c>') -- mac neovim binding
map('n', '<leader>nh', ':nohl<CR>') -- Hide search highlights
map('n', '<leader>q', ':q<CR>')
-- Window navigation simplifiying
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-L>', '<C-W><C-L>')
-- map('n', '<CR>', '<C-W>w')
map('n', '<leader>v', ':vs<CR>')
map('n', '<leader>s', ':sp<CR>')
map('n', '<leader>tc', ':TSContext toggle<CR>')

map('n', 'cn{', 'f{ci{')
map('n', 'cn[', 'f[ci[')

map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
---- Telescope binds
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>o', builtin.find_files, {})
--vim.keymap.set('n', '<leader>p', builtin.live_grep, {})
--vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {}) vim.keymap.set('n', '<leader>fm', builtin.man_pages)
--vim.keymap.set('n', '<leader>fc', builtin.colorscheme)
---- LSP binds
--map('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>')
--map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
--map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
--map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
--map('n', 'go', ':lua vim.lsp.buf.type_definition()<CR>')
--map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
--map('n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>')
--map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>')
--map('n', '<leader>lf', ':lua vim.lsp.buf.format({async=true})<CR>')
--map('x', '<leader>lf', ':lua vim.lsp.buf.format({async=true})<CR>')
--

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

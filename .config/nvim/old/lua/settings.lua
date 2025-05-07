-- Check System
local is_wsl = (function()
    local output = vim.fn.systemlist "uname -r" 
    return not not string.find(output[1] or "", "WSL")
end)()

local is_mac = vim.fn.has("macunix") == 1

-- local is_linux = not is_wsl and not is_mac

-- Leader Keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- APIs
local o = vim.opt
local g = vim.g

-- Faster Response Time
g.updatetime = 50

-- Scrolling
o.scrolloff=8
o.sidescrolloff=8

-- GUI
vim.cmd("set noshowmode") -- Dont display -- INSERT -- type messages
o.number = true -- Display Number Column
o.relativenumber = true -- Relative Line Numbers
o.termguicolors = true

o.signcolumn = 'yes' -- Display Sign Column

o.cursorline = true -- Highlight line cursor is on

o.cmdheight = 0 -- Don't Display Command Line below statusbar.
o.laststatus = 3 -- Keep One status bar fixed at bottom, with just dividers between windows

-- Undofile / backups
o.undofile = true -- Keep undo files to save undos for different sessions
g.undodir='$HOME/.undo'
g.noswapfile = true -- Don't use swapfiles
o.swapfile = false --         ^
g.nobackup = true -- Don't use backup files
o.backup = false --           ^

-- Bells
o.visualbell = true -- Use visual indicators for bells
g.noerrorbells = true -- No audio bells

-- Editing
o.expandtab = true -- Expand Tabs
o.clipboard = "unnamedplus" -- Use system clipboard
o.completeopt = "menuone,noselect" -- Needed for plugins like nvim-cmp
o.wrap = false -- Don't Wrap Text
o.tabstop = 4 -- Tab length: 4
o.shiftwidth = 4 --    ^
o.softtabstop = 0 -- Disable soft-tab stop
o.smartcase = true -- Case-sensitive if you use capital letters
o.ignorecase = true -- Non case-sensitive / and ? searching
o.autoindent = true -- Auto indentation
o.smartindent = true --       ^

-- Splits
o.splitbelow = true -- Splits horizontally to the bottom instead of top by default
o.splitright = true -- Splits vertically to the right instead of top by defaul

-- WSL specific Settings
if is_wsl then
    g.netrw_browsex_viewer = "cmd.exe /C start" -- Setting to open browser with WSL 2
end

-- highlight what you yanked
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup('HighlightYank', {})
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch', -- IncSearch, CurSearch, DiffAdd, NeoTreeTitleBar, Beacon
            timeout = 70,
        })
    end,
})

-- Trim paste
-- local function trim()
--   local save = vim.fn.winsaveview()
--   vim.cmd("keeppatterns %s/\\s\\+$\\|\\r$//e")
--   vim.fn.winrestview(save)
-- end

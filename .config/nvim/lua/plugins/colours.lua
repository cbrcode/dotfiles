-- return {
--   "olimorris/onedarkpro.nvim",
--   priority = 1000, -- Ensure it loads first
--   config=function()
--     vim.cmd[[colorscheme onedark_dark]]
--   end
-- }

-- return {
--     "nyoom-engineering/oxocarbon.nvim",
--     priority = 1000,
--     config=function ()
--         vim.cmd[[colorscheme oxocarbon]]
--     end
-- }


return {
   'catppuccin/nvim', name='catppuccin', priority=1000, config=function()
       vim.cmd[[colorscheme catppuccin-mocha]]
   end,
}

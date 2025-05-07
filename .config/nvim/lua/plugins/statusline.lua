-- return {
--     'bluz71/nvim-linefly'
-- }
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        local fn = require('lualine.components.filename')
        fn.apply_icon = require('lualine.components.filetype').apply_icon
        local function diff_source()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed
            }
          end
        end

        require('lualine').setup({
          options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = '',
            section_separators = {left = '', right = ''}, -- left = '', right = ''
            disabled_filetypes = {
              statusline = {},
              winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
              statusline = 1000,
              tabline = 1000,
              winbar = 1000,
            }
          },
          sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
              {'branch', icon = "", color= { gui = "bold" }},
              {
                "diff",
                symbols = { added = " ", modified = " ", removed = " " },
                source = diff_source,
                  -- diff_color = {
                  --   added = { fg = colors.green },
                  --   modified = { fg = colors.orange },
                  --   removed = { fg = colors.red },
                  -- },
              },
              {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = " ", warn = " ", info = " " },
                -- diagnostics_color = {
                --     color_error = { fg = colors.red },
                --     color_warn = { fg = colors.yellow },
                --     color_info = { fg = colors.cyan },
                -- },
              }
            },
            lualine_x = {
                {"filename"},
                {"%="},
                { "location", },
                { "encoding", },
                { "filetype" },
                { "fileformat" },
            },
            lualine_z = {}
          },
          -- inactive_sections = {
          --   lualine_a = {},
          --   lualine_b = {},
          --   lualine_c = {'filename'},
          --   lualine_x = {'location'},
          --   lualine_y = {},
          --   lualine_z = {}
          -- },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {}
        })
    end
}

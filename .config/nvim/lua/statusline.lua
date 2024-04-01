local fn = require('lualine.components.filename')
fn.apply_icon = require('lualine.components.filetype').apply_icon

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '',
    -- section_separators = '',
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
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      function()
        return "%="
      end,
      "filename"
    },
    --lualine_c = {'filename'},
    lualine_x = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { 'filename' },
    lualine_x = {'encoding', 'filetype'},
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
}

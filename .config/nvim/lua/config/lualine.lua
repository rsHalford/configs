local lualine = require 'lualine'

lualine.setup{
  options = {
    theme = 'gruvbox_dark',
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics', sources={'nvim_lsp'}},
    lualine_c = {'filename'},
    lualine_x = {'diff', 'branch'},
    lualine_y = {'filetype'},
    lualine_z = {'progress'},
  },
  extensions = {
    'fugitive',
    'fzf',
    'nvim-tree',
    'toggleterm',
  },
}


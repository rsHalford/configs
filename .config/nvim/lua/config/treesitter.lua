local ts_config = require 'nvim-treesitter.configs'

ts_config.setup {
  ensure_installed = 'maintained',
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  },
}

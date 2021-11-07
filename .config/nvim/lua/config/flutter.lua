local flutter = require 'flutter-tools'

vim.cmd [[autocmd Filetype dart nnoremap <silent><leader>o :FlutterOutlineToggle<CR>]]

flutter.setup {
  flutter_path = '/opt/flutter/bin/flutter',
  dev_log = {
    open_cmd = 'tabedit',
  },
  widget_guides = {
    enabled = true,
  },
}

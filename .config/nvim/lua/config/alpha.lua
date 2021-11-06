local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'
local fortune = require 'alpha.fortune'

dashboard.section.header.val = {
  '              ██████  ██████',
  '              ██░░██  ██░░██',
  '              ██░░██  ██░░██',
  '              ██░░██  ██░░██',
  '████████████████░░██████░░██',
  '██░░░░░░░░░░░░░░░░░░░░░░░░██',
  '██░░██████░░████░░██████░░██',
  '██░░██  ██░░░░░░░░██  ██░░██',
  '██░░██  ████████░░██  ██░░██',
  '██░░██  ██░░░░░░░░██  ██░░██',
  '██████  ████████████  ██████',
}

dashboard.section.buttons.val = {
  dashboard.button('n', '  > New file', ':tabe <BAR> startinsert <CR>'),
  dashboard.button('f', '  > Find file', ':Telescope file_browser<CR>'),
  dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
  dashboard.button('s', '  > Settings', ':tabe $MYVIMRC<CR>'),
  dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
}

dashboard.section.footer.val = fortune()

alpha.setup(dashboard.opts)

vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]

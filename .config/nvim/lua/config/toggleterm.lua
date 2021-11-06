local toggle = require 'toggleterm'
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>tt', [[<cmd>ToggleTerm<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>tc', [[<cmd>ToggleTermCloseAll<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>th', [[<cmd>ToggleTerm direction=horizontal<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>tv', [[<cmd>ToggleTerm direction=vertical<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>tf', [[<cmd>ToggleTerm direction=float<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>tw', [[<cmd>ToggleTerm direction=tab<CR>]], { noremap = true, silent = true })

toggle.setup {
  size = function(term)
    if term.direction == 'horizontal' then
      return vim.o.lines * 0.5
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<leader>tt]],
  -- shading_factor = 2,
  persist_size = false,
  direction = 'tab',
  float_opts = {
    border = 'curved',
  },
}

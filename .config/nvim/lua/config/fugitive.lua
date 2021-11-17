local keymap = vim.api.nvim_set_keymap
local g = vim.g

keymap('n', '<leader>gg', ':G<CR>', { noremap = true })

g.fugitive_summary_format = '%d %s'

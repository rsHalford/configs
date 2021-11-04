local saga = require 'lspsaga'
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>vf', [[<cmd>lua require('lspsaga.provider').lsp_finder()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>ca', [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], { noremap = true, silent = true })
keymap('v', '<leader>ca', [[<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>vh', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], { noremap = true, silent = true })
keymap('n', '<C-d>', [[<cmd>lua require('lspsaga.action').smart_scoll_with_saga(-1)()<CR>]], { noremap = true, silent = true })
keymap('n', '<C-f>', [[<cmd>lua require('lspsaga.action').smart_scoll_with_saga(1)()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>vr', [[<cmd>lua require('lspsaga.rename').rename()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>vd', [[<cmd>lua require('lspsaga.provider').preview_definition()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>ve', [[<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>[', [[<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>]], { noremap = true, silent = true })
keymap('n', '<leader>]', [[<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>]], { noremap = true, silent = true })

saga.init_lsp_saga()
vim.g.symbols_outline = {
  auto_preview = false,
  preview_bg_highlight = "#1d2021",
  lsp_blacklist = { "dartls" },
}


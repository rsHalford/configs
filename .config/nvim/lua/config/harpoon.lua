local harpoon = require 'harpoon'
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ha', [[:lua require("harpoon.mark").add_file()<CR>]], { noremap = true })
keymap('n', '<C-h>', [[:lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true })
keymap('n', '<C-j>', [[:lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true })
keymap('n', '<C-k>', [[:lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true })
keymap('n', '<C-l>', [[:lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true })
keymap('n', '<leader>hm', [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true })

harpoon.setup {
  global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
  },
}

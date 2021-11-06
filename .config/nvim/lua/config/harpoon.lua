local harpoon = require 'harpoon'
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ha', [[:lua require("harpoon.mark").add_file()<CR>]], { noremap = true })
keymap('n', '<leader>h1', [[:lua require("harpoon.ui").nav_file(1)<CR>]], { noremap = true })
keymap('n', '<leader>h2', [[:lua require("harpoon.ui").nav_file(2)<CR>]], { noremap = true })
keymap('n', '<leader>h3', [[:lua require("harpoon.ui").nav_file(3)<CR>]], { noremap = true })
keymap('n', '<leader>h4', [[:lua require("harpoon.ui").nav_file(4)<CR>]], { noremap = true })
keymap('n', '<leader>h5', [[:lua require("harpoon.ui").nav_file(5)<CR>]], { noremap = true })
keymap('n', '<leader>h6', [[:lua require("harpoon.ui").nav_file(6)<CR>]], { noremap = true })
keymap('n', '<leader>h7', [[:lua require("harpoon.ui").nav_file(7)<CR>]], { noremap = true })
keymap('n', '<leader>h8', [[:lua require("harpoon.ui").nav_file(8)<CR>]], { noremap = true })
keymap('n', '<leader>h9', [[:lua require("harpoon.ui").nav_file(9)<CR>]], { noremap = true })
keymap('n', '<leader>hm', [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]], { noremap = true })

harpoon.setup {
  global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
  },
}

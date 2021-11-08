local telescope = require 'telescope'
local previewers = require 'telescope.previewers'
local actions = require 'telescope.actions'
local keymap = vim.api.nvim_set_keymap

-- Navigate buffers and repos
keymap('n', '<leader>fb', [[<cmd>Telescope file_browser<CR>]], { noremap = true })
keymap('n', '<leader>fd', [[<cmd>Telescope lsp_definitions<CR>]], { noremap = true })
keymap('n', '<leader>fe', [[<cmd>Telescope lsp_workspace_diagnostics<CR>]], { noremap = true })
keymap('n', '<leader>fh', [[<cmd>Telescope help_tags<CR>]], { noremap = true })
keymap('n', '<leader>fi', [[<cmd>Telescope lsp_implementations<CR>]], { noremap = true })
keymap('n', '<leader>fk', [[<cmd>Telescope keymaps<CR>]], { noremap = true })
keymap('n', '<leader>fl', [[<cmd>Telescope live_grep<CR>]], { noremap = true })
keymap('n', '<leader>fo', [[<cmd>Telescope oldfiles<CR>]], { noremap = true })
keymap('n', '<leader>fr', [[<cmd>Telescope registers<CR>]], { noremap = true })
keymap('n', '<leader>fs', [[<cmd>Telescope grep_string<CR>]], { noremap = true })
keymap('n', '<leader>fz', [[<cmd>Telescope current_buffer_fuzzy_find<CR>]], { noremap = true })
keymap('n', '<leader>ft', [[<cmd>Telescope termfinder find<CR>]], { noremap = true })

-- Flutter
keymap('n', '<leader>fc', [[<cmd>lua require('telescope').extensions.flutter.commands()<CR>]], { noremap = true })

-- Git Pickers
keymap('n', '<leader>gc', [[<cmd>Telescope git_commits<CR>]], { noremap = true })
keymap('n', '<leader>gbc', [[<cmd>Telescope git_bcommits<CR>]], { noremap = true })
keymap('n', '<leader>gbr', [[<cmd>Telescope git_branches<CR>]], { noremap = true })
keymap('n', '<leader>gf', [[<cmd>Telescope git_files<CR>]], { noremap = true })
keymap('n', '<leader>gst', [[<cmd>Telescope git_status<CR>]], { noremap = true })
keymap('n', '<leader>gsa', [[<cmd>Telescope git_stash<CR>]], { noremap = true })

telescope.setup {
  defaults = {
    prompt_prefix = ' ',
    layout_strategy = 'flex',
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    mappings = {
      i = {
        ['<C-k>'] = actions.preview_scrolling_up,
        ['<C-j>'] = actions.preview_scrolling_down,
      },
      n = {
        ['<C-k>'] = actions.preview_scrolling_up,
        ['<C-j>'] = actions.preview_scrolling_down,
      },
    },
  },
}

-- Extensions
telescope.load_extension 'fzf'
telescope.load_extension 'flutter'
telescope.load_extension 'termfinder'

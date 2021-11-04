local g = vim.g
local ntree = require 'nvim-tree'
local ntree_cb = require("nvim-tree.config").nvim_tree_callback
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>b', [[<cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })

g.nvim_tree_gitignore = 1
-- g.nvim_tree_show_icons = {
--   'git' = 0,
--   'folders' = 1,
--   'files' = 1,
--   'folder_arrows' = 1,
-- }

local list = {
  { key = "o",                            cb = ntree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = ntree_cb("cd") },
  { key = "<C-v>",                        cb = ntree_cb("vsplit") },
  { key = "<C-x>",                        cb = ntree_cb("split") },
  { key = { "<CR>", "<C-t>" },            cb = ntree_cb("tabnew") },
  { key = "<",                            cb = ntree_cb("prev_sibling") },
  { key = ">",                            cb = ntree_cb("next_sibling") },
  { key = "P",                            cb = ntree_cb("parent_node") },
  { key = "<BS>",                         cb = ntree_cb("close_node") },
  { key = "<S-CR>",                       cb = ntree_cb("close_node") },
  { key = "<Tab>",                        cb = ntree_cb("preview") },
  { key = "K",                            cb = ntree_cb("first_sibling") },
  { key = "J",                            cb = ntree_cb("last_sibling") },
  { key = "I",                            cb = ntree_cb("toggle_ignored") },
  { key = "H",                            cb = ntree_cb("toggle_dotfiles") },
  { key = "R",                            cb = ntree_cb("refresh") },
  { key = "a",                            cb = ntree_cb("create") },
  { key = "d",                            cb = ntree_cb("remove") },
  { key = "r",                            cb = ntree_cb("rename") },
  { key = "<C-r>",                        cb = ntree_cb("full_rename") },
  { key = "x",                            cb = ntree_cb("cut") },
  { key = "c",                            cb = ntree_cb("copy") },
  { key = "p",                            cb = ntree_cb("paste") },
  { key = "y",                            cb = ntree_cb("copy_name") },
  { key = "Y",                            cb = ntree_cb("copy_path") },
  { key = "gy",                           cb = ntree_cb("copy_absolute_path") },
  { key = "[c",                           cb = ntree_cb("prev_git_item") },
  { key = "]c",                           cb = ntree_cb("next_git_item") },
  { key = "-",                            cb = ntree_cb("dir_up") },
  { key = "s",                            cb = ntree_cb("system_open") },
  { key = "q",                            cb = ntree_cb("close") },
  { key = "g?",                           cb = ntree_cb("toggle_help") },
}

ntree.setup{
  disable_netrw = false,
  open_on_setup = true,
  ignore_ft_on_setup = { "vim" },
  auto_close = true,
  open_on_tab = true,
  hijack_cursor = true,
  diagnostics = {
    enable = true,
  },
  view = {
    width = 20,
    height = 8,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = true,
      list = list
    },
  },
}

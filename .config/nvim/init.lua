local g = vim.g
local cmd = vim.cmd
local opt = vim.opt
local api = vim.api
local keymap = api.nvim_set_keymap

require 'plugins'

-- Settings
opt.autochdir = true
opt.cmdheight = 1
opt.colorcolumn = '80'
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.cursorcolumn = true
opt.cursorline = true
opt.errorbells = false
opt.expandtab = true
opt.guicursor = ''
opt.hlsearch = false
opt.ignorecase = true
opt.number = true
opt.path:append('**')
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 2
opt.shortmess:append('c')
opt.signcolumn = 'no'
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.spelllang = 'en_gb'
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.title = true
opt.undofile = true
opt.updatetime = 50
opt.wildmode = {'longest', 'list', 'full'}

-- Leader Keys
g.mapleader = [[ ]]
g.user_emmet_leader_key= [[,]]

-- Python Venv
g.python3_host_prog='/usr/bin/python3'

cmd([[
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType py setlocal ts=4 sw=4 sts=4
autocmd BufWritePre *.py execute ':Black'
autocmd FileType go setlocal ts=4 sw=4 sts=0 noexpandtab
]])

-- Yank Line End
keymap('n', 'Y', 'y$', { noremap = true })

-- Center Next
keymap('n', 'n', 'nzzzv', { noremap = true })
keymap('n', 'N', 'Nzzzv', { noremap = true })
keymap('n', 'J', 'mzJ`z', { noremap = true })

-- Undo Breakpoints
keymap('i', ',', ',<c-g>u', { noremap = true })
keymap('i', '.', '.<c-g>u', { noremap = true })
keymap('i', '?', '?<c-g>u', { noremap = true })
keymap('i', '!', '!<c-g>u', { noremap = true })
keymap('i', '[', '[<c-g>u', { noremap = true })
keymap('i', '{', '{<c-g>u', { noremap = true })
keymap('i', '(', '(<c-g>u', { noremap = true })

-- Navigation
keymap('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
keymap('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
keymap('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
keymap('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
keymap('n', 'k', [[(v:count > 5 ? "m'" . v:count : "") . 'k']], { noremap = true, expr = true })
keymap('n', 'j', [[(v:count > 5 ? "m'" . v:count : "") . 'j']], { noremap = true, expr = true })

-- Moving Text
keymap('v', 'J', [[:m '>+1<CR>gv=gv]], { noremap = true })
keymap('v', 'K', [[:m '<-2<CR>gv=gv]], { noremap = true })
keymap('i', '<C-j>', '<esc>:m .+1<CR>==', { noremap = true })
keymap('i', '<C-k>', '<esc>:m .-2<CR>==', { noremap = true })
-- api.nvim_set_keymap('n', '<leader>j', ':m .+1<CR>==', { noremap = true })
-- api.nvim_set_keymap('n', '<leader>k', ':m .-2<CR>==', { noremap = true })

-- Rezising Windows
keymap('n', 'zh', ':vertical resize -5<CR>', { noremap = true, silent = true })
keymap('n', 'zj', ':resize +2<CR>', { noremap = true, silent = true })
keymap('n', 'zk', ':resize -2<CR>', { noremap = true, silent = true })
keymap('n', 'zl', ':vertical resize +5<CR>', { noremap = true, silent = true })

-- Netrw
keymap('n', '<leader>pv', ':wincmd v<BAR> :Ex <BAR> :vertical resize 20<CR>', { noremap = true })
g.netrw_banner=0
g.netrw_winsize=25
g.netrw_browse_split=3
g.netrw_altv=1
g.netrw_liststyle=3
g.netrw_list_hide='netrw_gitignore#Hide()'
g.netrw_list_hide=[[,(^|ss)zs\S+]]

-- Undotree
keymap('n', '<leader>z', ':UndotreeShow<CR>', { noremap = true })

-- List document's URLs
keymap('n', '<leader>u', ':w<Home>silent <End> !urlview<CR>', { noremap = true })

-- Copy & Paste
cmd([[
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction
]])

-- Gruvbox
g.gruvbox_contrast_dark = 'hard'
cmd([[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
]])
g.gruvbox_invert_selection = '0'
cmd([[
colorscheme gruvbox
highlight ColorColumn guibg=#282828
highlight CursorColumn guibg=#282828
highlight CursorLine guibg=#282828
highlight CursorLineNR guibg=#282828
highlight GitSignsAddNr guibg=None guifg=#b8bb26
highlight GitSignsChangeNr guibg=None guifg=#8ec07c
highlight GitSignsDeleteNr guibg=None guifg=#fb4934
highlight EndOfBuffer guifg=#1d2021
highlight VertSplit guifg=#282828
highlight VertSplit guibg=#282828
highlight Comment gui=italic
]])

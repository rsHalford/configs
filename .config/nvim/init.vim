" Plugins (Vim-Plug)
filetype plugin on
call plug#begin('~/.local/share/vim/plugged')

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'akinsho/flutter-tools.nvim'
Plug 'tami5/lspsaga.nvim'

" Cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'simrat39/symbols-outline.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'szw/vim-maximizer'
Plug 'dbeniamine/cheat.sh-vim'

" Editing
Plug 'psf/black'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-repeat'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" Prose
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/vim-pencil'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'dbmrq/vim-ditto'
Plug 'preservim/vim-litecorrect'
Plug 'kana/vim-textobj-user'
Plug 'preservim/vim-textobj-quote'
Plug 'preservim/vim-textobj-sentence'
Plug 'preservim/vim-wordy'

" UI
Plug 'gruvbox-community/gruvbox'
Plug 'goolord/alpha-nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

" Settings
syntax enable
set autochdir
set autoindent
set background=dark
set cmdheight=1
set colorcolumn=80
set completeopt=menu,menuone,noselect
set cursorcolumn
set cursorline
set encoding=utf-8
set expandtab
set guicursor=
set hidden
set nohlsearch
set ignorecase
set incsearch
set nobackup
set noerrorbells
set nohlsearch
set noswapfile
set nowritebackup
set number relativenumber
set path+=**
set scrolloff=8
set shiftwidth=2
set shortmess+=c
set signcolumn=no
set smartcase
set smartindent
set splitbelow splitright
set spelllang=en_gb
set tabstop=2 softtabstop=2
set termguicolors
set title
set undodir=~/.cache/nvim/undo
set undofile
set updatetime=50
set wildmenu
set wildmode=longest,list,full


" Vim Theming
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection = '0'
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
let g:airline_symbols_ascii = 1


" Leader Keys
let mapleader=" "
let g:user_emmet_leader_key=','


" Yank Line End
nnoremap Y y$


" Center Next
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


" Undo Breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap [ [<c-g>u
inoremap { {<c-g>u
inoremap ( (<c-g>u


" Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'


" Moving Text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==


" Rezising Windows
nnoremap <silent>zh :vertical resize -5<CR>
nnoremap <silent>zj :resize +2<CR>
nnoremap <silent>zk :resize -2<CR>
nnoremap <silent>zl :vertical resize +5<CR>
nnoremap <leader>m :MaximizerToggle!<CR>


" Netrw
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 20<CR>
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_browse_split=3
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\\S\+'


" Undotree
nnoremap <leader>z :UndotreeShow<CR>


" File Type Formatting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType py setlocal ts=4 sw=4 sts=4
autocmd BufWritePre *.py execute ':Black'
autocmd FileType go setlocal ts=4 sw=4 sts=0 noexpandtab


" Python Venv
let g:python3_host_prog='/usr/bin/python3'


" Copy and Paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction


" List document's URLs
nnoremap <leader>u :w<Home>silent <End> !urlview<CR>


" Telescope
nnoremap <leader>fb <cmd>lua require('telescope.builtin').file_browser()<CR>
nnoremap <leader>fc <cmd>lua require('telescope').extensions.flutter.commands()<CR>
nnoremap <leader>fz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<CR>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').registers()<CR>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<CR>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>fe <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap <leader>fi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>


" Git Pickers
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>gbc <cmd>lua require('telescope.builtin').git_bcommits()<CR>
nnoremap <leader>gbr <cmd>lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gst <cmd>lua require('telescope.builtin').git_status()<CR>
nnoremap <leader>gsa <cmd>lua require('telescope.builtin').git_stash()<CR>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    prompt_prefix = " ",
    layout_strategy = "flex",
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
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
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,
      },
      n = {
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,
      },
    },
  },
  pickers = {
    file_browser = {
      hidden = true,
      mappings = {
        i = {
          ["<CR>"] = actions.select_tab,
        },
        n = {
          ["<CR>"] = actions.select_tab,
        },
      },
    },
    git_files = {
      hidden = true,
      mappings = {
        i = {
          ["<CR>"] = actions.select_tab,
        },
        n = {
          ["<CR>"] = actions.select_tab,
        },
      },
    },
    grep_string = {
      hidden = true,
      mappings = {
        i = {
          ["<CR>"] = actions.select_tab,
        },
        n = {
          ["<CR>"] = actions.select_tab,
        },
      },
    },
    live_grep = {
      hidden = true,
      mappings = {
        i = {
          ["<CR>"] = actions.select_tab,
        },
        n = {
          ["<CR>"] = actions.select_tab,
        },
      },
    },
    oldfiles = {
      hidden = true,
      mappings = {
        i = {
          ["<CR>"] = actions.select_tab,
        },
        n = {
          ["<CR>"] = actions.select_tab,
        },
      },
    },
  }
}
require('telescope').load_extension('fzf')
EOF


" DAP
nnoremap <silent><leader>dc <cmd>lua require('dap').continue()<CR>
nnoremap <silent><leader>db <cmd>lua require('dap').toggle_breakpoint()<CR>
nnoremap <silent><leader>di <cmd>lua require('dap').step_into()<CR>
nnoremap <silent><leader>do <cmd>lua require('dap').step_over()<CR>
nnoremap <silent><leader>dr <cmd>lua require('dap').repl.open()<CR>


" Treesitter
lua << EOF
require('nvim-treesitter.configs').setup { 
  ensure_installed = "maintained",
  indent = {
    enable = true
  },
  highlight = { 
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  },
}
EOF


" LspSaga
nnoremap <silent><leader>vf <cmd>lua require('lspsaga.provider').lsp_finder()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent><leader>vh <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent><C-d> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent><leader>vr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent><leader>vd <cmd>lua require('lspsaga.provider').preview_definition()<CR>
nnoremap <silent><leader>ve <cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>
nnoremap <silent><leader>[ <cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>
nnoremap <silent><leader>] <cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>


" Symbols
autocmd Filetype dart nnoremap <silent><leader>o :FlutterOutlineToggle<CR>
nnoremap <silent><leader>o :SymbolsOutline<CR>


" File Browser
nnoremap <silent><leader>b :NvimTreeToggle<CR>


" Terminal
nnoremap <silent><leader>tt :ToggleTerm<CR>
nnoremap <silent><leader>tc :ToggleTermCloseAll<CR>
nnoremap <silent><leader>th :ToggleTerm direction=horizontal<CR>
nnoremap <silent><leader>tv :ToggleTerm direction=vertical<CR>
nnoremap <silent><leader>tf :ToggleTerm direction=float<CR>
nnoremap <silent><leader>tw :ToggleTerm direction=tab<CR>


" Nvim-Tree
let g:nvim_tree_gitignore = 1
let g:nvim_tree_show_icons = {
	\ 'git': 0,
	\ 'folders': 1,
	\ 'files': 1,
  \ 'folder_arrows': 1,
	\}


" Lsp Config & Cmp
lua << EOF

-- Setup nvim-cmp.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
  end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.expand_or_jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources{
    { name = 'nvim_lsp', priority = 100 },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'emoji', opts = {insert = true}},
  },
})

-- Setup Lua-Language-Server
local sumneko_binary = "/usr/bin/lua-language-server"
local sumneko_main = "/usr/lib/lua-language-server/main.lua"
require("lspconfig").sumneko_lua.setup{
  cmd = {sumneko_binary, "-E", sumneko_main},
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
          -- Setup your lua path
          path = vim.split(package.path, ';')
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        }
      }
    }
  }
}


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local nvim_lsp = require('lspconfig')
local servers = {'bashls', 'cssls', 'dartls', 'gopls', 'html', 'jsonls', 'pyright', 'svelte', 'tsserver', 'vimls', 'vuels', 'yamlls',}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    capabilities = capabilities
}
end

require("luasnip.loaders.from_vscode").lazy_load()
require("lspsaga").init_lsp_saga()
vim.g.symbols_outline = {
  auto_preview = false,
  preview_bg_highlight = "#1d2021",
  lsp_blacklist = { "dartls" },
}
require('lualine').setup{
  options = {
    theme = 'gruvbox_dark',
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diagnostics', sources={'nvim_lsp'}},
    lualine_c = {'filename'},
    lualine_x = {'diff', 'branch'},
    lualine_y = {'filetype'},
    lualine_z = {'progress'},
  },
  extensions = {
    'fugitive',
    'fzf',
    'nvim-tree',
    'toggleterm',
  },
}
require('nvim-autopairs').setup{}
require('gitsigns').setup({
  numhl = true,
  signcolumn = false,
})
require('colorizer').setup(nil, {css = true})
require('Comment').setup({
  ignore = '^$',
  mappings = {
    extended = true,
  },
})
-- zen-mode
-- FIX: fix augroup prose (traailing white space Error 448)
require('zen-mode').setup{
  window = {
    backdrop = 1,
    width = 70,
    height = 0.8,
    options = {
      number = false,
      relativenumber = false,
      cursorline = false,
      cursorcolumn = false,
    },
  },
  on_open = function(_)
    vim.cmd 'cabbrev <buffer> q let b:quitting = 1 <bar> q'
    vim.cmd 'cabbrev <buffer> wq let b:quitting = 1 <bar> wq'
  end,
  on_close = function()
    if vim.b.quitting == 1 then
      vim.b.quitting = 0
      vim.cmd 'q'
    end
  end,
}
require('twilight').setup{
  dimming = {
    alpha = 0.3,
  },
  context = 0,
}
require('toggleterm').setup{
  size = function(term)
    if term.direction == "horizontal" then
      return vim.o.lines * 0.2
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<leader>tt]],
  -- shading_factor = 2,
  persist_size = false,
  float_opts = {
    border = 'curved',
  }
}
local tree_cb = require("nvim-tree.config").nvim_tree_callback
local list = {
  { key = "o",                            cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  { key = "<C-v>",                        cb = tree_cb("vsplit") },
  { key = "<C-x>",                        cb = tree_cb("split") },
  { key = { "<CR>", "<C-t>" },            cb = tree_cb("tabnew") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<BS>",                         cb = tree_cb("close_node") },
  { key = "<S-CR>",                       cb = tree_cb("close_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "]c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "s",                            cb = tree_cb("system_open") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}
require('nvim-tree').setup{
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
    side = "right",
    auto_resize = true,
    mappings = {
      custom_only = true,
      list = list
    },
  },
}

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local fortune = require('alpha.fortune')
dashboard.section.header.val = {
  "████████████████ ██████████████ ██████  ██████",
  "██░░░░░░░░░░░░██ ██░░░░░░░░░░██ ██░░██  ██░░██",
  "██░░████████░░██ ██░░██████████ ██░░██  ██░░██",
  "██░░██    ██░░██ ██░░██         ██░░██  ██░░██",
  "██░░████████░░██ ██░░██████████ ██░░██████░░██",
  "██░░░░░░░░░░░░██ ██░░░░░░░░░░██ ██░░░░░░░░░░██",
  "██░░██████░░████ ██████████░░██ ██░░██████░░██",
  "██░░██  ██░░██           ██░░██ ██░░██  ██░░██",
  "██░░██  ██░░████ ██████████░░██ ██░░██  ██░░██",
  "██░░██  ██░░░░██ ██░░░░░░░░░░██ ██░░██  ██░░██",
  "██████  ████████ ██████████████ ██████  ██████",
}
dashboard.section.buttons.val = {
  dashboard.button( "n", "  > New file" , ":tabe <BAR> startinsert <CR>"),
  dashboard.button( "f", "  > Find file", ":Telescope file_browser<CR>"),
  dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
  dashboard.button( "s", "  > Settings" , ":tabe $MYVIMRC<CR>"),
  dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}
dashboard.section.footer.val = fortune()
alpha.setup(dashboard.opts)
vim.cmd([[
  autocmd FileType alpha setlocal nofoldenable
]])
EOF


" efm-langserver cofiguration
lua << EOF
local black = {
    formatCommand = 'black -',
    formatStdin = true,
}
local isort = {
    formatCommand = 'isort --profile black -',
    formatStdin = true,
}
local flake8 = {
    lintCommand = 'flake8 --max-doc-length 72 --max-line-length 88 --extend-ignore=E203 --stdin-display-name ${INPUT} -',
    lintStdin = true,
    lintFormats = { '%f:%l:%c: %m' },
    lintSource = 'flake8',
}
local mypy = {
    lintCommand = 'mypy --show-column-numbers --disallow-any-generics --disallow-untyped-def --ignore-missing-imports',
    lintFormats = {
        '%f:%l:%c: %trror: %m',
        '%f:%l:%c: %tarning: %m',
        '%f:%l:%c: %tote: %m',
    },
    lintSource = 'mypy',
}
local golangciLint = {
  lintCommand = "golangci-lint run",
  lintSource = "golangci-lint",
}
local stylua = {
  formatCommand = "stylua -",
  formatStdin = true,
}

require'lspconfig'.efm.setup{
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      go = {golangciLint},
      python = { black, isort, flake8, mypy },
      lua = { stylua },
    },
  },
}
EOF


" Flutter Tools
lua << EOF
require('telescope').load_extension('flutter')
require("flutter-tools").setup{
  flutter_path = '/opt/flutter/bin/flutter',
  dev_log = {
    open_cmd = 'tabedit',
  },
  widget_guides = {
    enabled = true,
  },
}
EOF

source $XDG_CONFIG_HOME/nvim/config/prose.vim

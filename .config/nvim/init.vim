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
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

" Prose
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dbmrq/vim-ditto'
Plug 'preservim/vim-litecorrect'
Plug 'kana/vim-textobj-user'
Plug 'preservim/vim-textobj-quote'
Plug 'preservim/vim-textobj-sentence'
Plug 'preservim/vim-wordy'

" UI
Plug 'gruvbox-community/gruvbox'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'vim-airline/vim-airline'
"Plug 'famiu/feline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons',
Plug 'ap/vim-css-color',
call plug#end()

" Settings
syntax enable
set autochdir
set autoindent
set background=dark
set cmdheight=1
set colorcolumn=88
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
set signcolumn=yes
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
set viminfo=""
set wildmenu
set wildmode=longest,list,full


" Vim Theming
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
highlight ColorColumn guibg=#1d2021
colorscheme gruvbox
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


" Open terminal below
nnoremap <leader>pt :below 10sp term://$SHELL<CR>
tnoremap <Esc> <C-\><C-n>
augroup terminal_settings
    autocmd!
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
    autocmd TermOpen *
        \ if &buftype ==# 'terminal' |
        \ below resize 10 |
        \ endif
    autocmd TermClose term://*
        \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "lf") && (expand('<afile>') !~ "coc") |
        \   call nvim_input('<CR>')  |
        \ endif
augroup END


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
nnoremap <leader>fb <cmd>lua require('telescope.builtin').file_browser({hidden="false"})<CR>
nnoremap <leader>fc <cmd>lua require('telescope').extensions.flutter.commands()<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<CR>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').registers()<CR>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>fe <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap <leader>fi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>


" Git Pickers
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>gbc <cmd>lua require('telescope.builtin').git_bcommits()<CR>
nnoremap <leader>gbr<cmd>lua require('telescope.builtin').git_branches()<CR>
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
    file_sorter =  require('telescope.sorters').get_fzy_sorter,
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
        ["<CR>"] = actions.select_tab,
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,
      },
      n = {
        ["<CR>"] = actions.select_tab,
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,
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


" Treesitter Picker
"nnoremap <leader>ts <cmd>lua require('telescope.builtin').treesitter()<CR>

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
    enable = true
  }
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
nnoremap <silent><leader>so :SymbolsOutline<CR>


" File Browser
nnoremap <silent><leader>b :NvimTreeToggle<CR>


" Lsp Config & Cmp
lua << EOF

-- Setup nvim-cmp.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local saga = require("lspsaga")
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
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
saga.init_lsp_saga()

require('lualine').setup{
  options = {theme = 'gruvbox_dark'},
  extensions = {'fugitive'},
}
require('nvim-autopairs').setup{}
require('gitsigns').setup()
require('nvim-tree').setup{}
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

require'lspconfig'.efm.setup{
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      go = {golangciLint},
      python = { black, isort, flake8, mypy },
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

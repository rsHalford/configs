" Plugins (Vim-Plug)
filetype plugin on
call plug#begin('~/.local/share/vim/plugged')

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'akinsho/flutter-tools.nvim'

" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Debugging
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'dbeniamine/cheat.sh-vim'
"Plug 'nvim-telescope/telescope-vimspector.nvim'

" Editing
Plug 'psf/black'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'

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

" Theme
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons',
call plug#end()

source $XDG_CONFIG_HOME/nvim/config/prose.vim

" Settings
syntax enable
set autochdir
set autoindent
set background=dark
set cmdheight=1
set colorcolumn=80
set completeopt=menuone,noinsert,noselect
set cursorcolumn
set cursorline
set encoding=utf-8
set expandtab
set guicursor=
set hidden
set nohlsearch
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
set smartindent
set splitbelow splitright
set spelllang=en_gb
set tabstop=2 softtabstop=2
set termguicolors
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
highlight ColorColumn ctermbg=0 guibg=#1d2021
colorscheme gruvbox

" Leader Keys
let mapleader=" "
let g:user_emmet_leader_key=','


" Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>


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


" Vimspector (Debugging)
nnoremap <leader>db :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dh <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun


" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
if executable('rg')
    let g:rg_derive_root='true'
endif
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Undotree
nnoremap <leader>z :UndotreeShow<CR>


" File Type Formatting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType py setlocal ts=4 sw=4 sts=4
autocmd BufWritePre *.py execute ':Black'
autocmd FileType go setlocal ts=4 sw=4 sts=0 noexpandtab


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
EOF


" Treesitter Picker
"nnoremap <leader>ts <cmd>lua require('telescope.builtin').treesitter()<CR>

" Treesitter
lua << EOF
require('nvim-treesitter.configs').setup { 
  ensure_installed = { 'bash', 'css', 'dart', 'go', 'html', 'javascript', 'json', 'python', 'scss', 'toml', 'typescript', 'vue', 'yaml' },
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


" Lsp Config
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>v[ :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>v] :lua vim.lsp.diagnostic.goto_next()<CR>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
autocmd BufEnter * lua require('completion').on_attach()
lua vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
lua require('lspconfig').bashls.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').cssls.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').dartls.setup{}
lua require('lspconfig').gopls.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').html.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').jsonls.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').pyright.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').svelte.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').tsserver.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').vimls.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').vuels.setup{ on_attach=require('completion').on_attach }
lua require('lspconfig').yamlls.setup{ on_attach=require('completion').on_attach }


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

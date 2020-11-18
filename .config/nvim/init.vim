" Plugins (Vim-Plug)
filetype plugin on
call plug#begin('~/.local/share/vim/plugged')
Plug 'dart-lang/dart-vim-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kevinoid/vim-jsonc',
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()


" Settings
syntax enable
set autochdir
set autoindent
set background=dark
set cmdheight=2
set colorcolumn=80
set cursorcolumn
set cursorline
set encoding=utf-8
set expandtab
set hidden
set incsearch
set nobackup
set noerrorbells
set noswapfile
set nowritebackup
set number relativenumber
set path+=**
set shiftwidth=2
set shortmess+=c
set smartcase
set smartindent
set splitbelow splitright
set tabstop=2 softtabstop=2
set termguicolors
set undodir=~/.cache/vim/undo
set undofile
set updatetime=300
set viminfo=""
set wildmenu
set wildmode=longest,list,full


" Editing init.vim
nnoremap <silent> <leader>vc :e $MYVIMRC<CR>
autocmd BufWritePost $MYVIMRC source %


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
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun


" Netrw
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 20<CR>
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_browse_split=3
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'


" Open terminal below
nnoremap <leader>pt :below 10sp term://$SHELL<CR>
"tnoremap <Esc> <C-\><C-n>
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


" Coc Commands
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <leader>ga <Plug>(coc-codeaction-selected)
nmap <leader>gf <Plug>(coc-format-selected)
nnoremap <leader>cr :CocRestart
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()


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


" fzf
nnoremap <leader>pf :Files<CR>
nnoremap <leader>pg :GFiles<CR>
nnoremap <leader>ps :Rg<SPACE>
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
autocmd Filetype py setlocal ts=4 sw=4 sts=4


" Copy and Paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction


" Vim Theming
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
highlight ColorColumn ctermbg=0 guibg=#1d2021


" List document's URLs
nnoremap <leader>u :w<Home>silent <End> !urlview<CR>


" Open mail with goyo focussed view
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

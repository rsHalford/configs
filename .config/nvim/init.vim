syntax enable
filetype plugin on

call plug#begin('~/.local/share/vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch':'release'}
"Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'vuciv/vim-bujo'
Plug 'junegunn/goyo.vim'
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

"set nocompatible
set encoding=utf-8
set number relativenumber
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set cursorcolumn
set cursorline
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set expandtab
set autoindent
set smartindent
"set nowrap
set smartcase
set autochdir
set noswapfile
set nobackup
set undodir=~/.cache/vim/undo
set viminfo=""
set undofile
set incsearch
set splitbelow splitright
"set termwinsize=8x0
set path+=**
set wildmenu
set wildmode=longest,list,full
colorscheme gruvbox
set background=dark
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=#1d2021
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd Filetype dart setlocal ts=2 sw=2 sts=2

let mapleader=" "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>z :UndotreeShow<CR>
nnoremap <leader>u :w<Home>silent <End> !urlview<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 20<CR>
nnoremap <leader>pt :ter<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>pg :GFiles<CR>
nnoremap <silent>zh :vertical resize -5<CR>
nnoremap <silent>zj :resize +2<CR>
nnoremap <silent>zk :resize -2<CR>
nnoremap <silent>zl :vertical resize +5<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart
nmap <leader>f <Plug>(coc-format-selected)
nnoremap <leader>tt :topleft Todo<CR>
nnoremap <leader>tg :topleft Todo g<CR>
nmap <leader>ta <Plug>BujoAddnormal
nmap <leader>td <Plug>BujoChecknormal

let g:user_emmet_leader_key=','
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

augroup myterm | au!
    au TermOpen * if &buftype ==# 'terminal' | resize 20 | vert resize 50 | endif
augroup end

if executable('rg')
    let g:rg_derive_root='true'
endif

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

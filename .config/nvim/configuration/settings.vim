syntax enable
"set nocompatible
"set nowrap
"set termwinsize=8x0
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
set shiftwidth=4
set shortmess+=c
set smartcase
set smartindent
set splitbelow splitright
set tabstop=4 softtabstop=4
set undodir=~/.cache/vim/undo
set undofile
set updatetime=300
set viminfo=""
set wildmenu
set wildmode=longest,list,full
highlight ColorColumn ctermbg=0 guibg=#1d2021
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd Filetype dart setlocal ts=2 sw=2 sts=2

" Copy/Paste into vim insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

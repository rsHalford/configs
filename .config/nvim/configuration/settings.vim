syntax enable
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

"Copy/Paste into vim insert mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

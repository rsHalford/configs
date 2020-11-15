source $HOME/.config/nvim/configuration/settings.vim


filetype plugin on

call plug#begin('~/.local/share/vim/plugged')
"Plug 'neovim/nvim-lspconfig'
Plug 'dart-lang/dart-vim-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kevinoid/vim-jsonc',
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vuciv/vim-bujo'
call plug#end()

colorscheme gruvbox

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
nmap <leader>a <Plug>(coc-codeaction-selected)

let g:user_emmet_leader_key=','
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_browse_split=3
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

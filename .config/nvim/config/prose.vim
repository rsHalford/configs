function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile /tmp/neomutt* set filetype=mail

nmap -d <Plug>DittoPrev
nmap =d <Plug>DittoNext
nnoremap <C-s> [s1z=<c-o>
inoremap <C-s> <c-g>u<Esc>[s1z=`]A<c-g>u

let g:goyo_width = 80
let g:pencil#textwidth = 80
let g:limelight_default_coefficient = 0.7
let user_dict = {
  \ 'maybe': ['mabye'],
  \ 'medieval': ['medival', 'mediaeval', 'medevil'],
  \ 'then': ['hten'],
  \}

augroup prose
  autocmd!
  autocmd FileType markdown,text,groff,tex,mail :Goyo
    \ | execute 'Limelight0.7'
    \ | execute 'DittoOn'
    \ | set nocursorcolumn
    \ | set nocursorline
    \ | set spell
    \ | call pencil#init({'wrap': 'soft'})
    \ | call litecorrect#init(user_dict)
    \ | call textobj#quote#init()
    \ | call textobj#sentence#init()
    \ | call wordy#init()
augroup END


" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
nmap <leader>pm <Plug>MarkdownPreviewToggle

augroup mutt
  autocmd!
  autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
  autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
  autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
augroup END
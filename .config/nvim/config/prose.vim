autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile /tmp/neomutt* set filetype=mail

map <C-c> :w<CR>:!compiler %:p<CR>
nmap -d <Plug>DittoPrev
nmap =d <Plug>DittoNext
nnoremap <C-s> [s1z=<c-o>
inoremap <C-s> <c-g>u<Esc>[s1z=`]A<c-g>u
nnoremap <leader>ss <cmd>lua require('telescope.builtin').spell_suggest()<CR>

let nroff_is_groff = 1
let nroff_space_errors = 1
hi def nroffDefinition cterm=italic gui=reverse
hi def nroffDefSpecial cterm=italic,bold gui=reverse,bold
let b:preprocs_as_sections = 1

let g:pencil#textwidth = 70
let user_dict = {
  \ 'maybe': ['mabye'],
  \ 'medieval': ['medival', 'mediaeval', 'medevil'],
  \ 'then': ['hten'],
  \}

augroup prose
  autocmd!
  autocmd FileType groff,mail,markdown,text :ZenMode
    \ | execute 'DittoOn'
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
let g:mkdp_browser = "qutebrowser"
nmap <leader>pm <Plug>MarkdownPreviewToggle

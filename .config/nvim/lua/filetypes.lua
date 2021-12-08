local g = vim.g
local cmd = vim.cmd

-- Use extensions as specific filetypes
cmd [[
autocmd BufRead,BufNewFile /tmp/neomutt* set filetype=mail
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType go setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd FileType py setlocal ts=4 sw=4 sts=4
autocmd BufWritePre *.py execute ':Black'
]]

-- Groff
cmd [[
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
let nroff_is_groff = 1
let nroff_space_errors = 1
let b:preprocs_as_sections = 1
hi def nroffDefinition cterm=italic gui=reverse
hi def nroffDefSpecial cterm=italic,bold gui=reverse,bold
]]

-- Prose
cmd [[
let g:pencil#textwidth = 70

augroup prose
  autocmd!
  autocmd FileType groff,mail,markdown,text ":ZenMode
    \ | execute 'DittoOn'
    \ | set spell
    \ | call pencil#init({'wrap': 'soft'})
    \ | call litecorrect#init()
    \ | call textobj#quote#init()
    \ | call textobj#sentence#init()
    \ | call wordy#init()
augroup END
]]

-- Markdown Preview
g.mkdp_auto_start = 0
g.mkdp_auto_close = 0
g.mkdp_browser = 'qutebrowser'

nmap <leader>dn <Plug>vimspector#StepOver
nmap <leader>di <Plug>vimspector#StepInto
nmap <leader>do <Plug>vimspector#StepOut

nnoremap <leader>dc :call vimspector#Continue()
nnoremap <leader>ddb :call vimspector#Clearreakpoints()

nmap <leader>dr <Plug>vimspector#Restart
nmap <leader>drc <Plug>vimspector#RunToCursor
nmap <leader>db <Plug>vimspector#ToggleBreakPoint
nmap <leader>dcb <Plug>vimspector#ToggleConditionalBreakPoint

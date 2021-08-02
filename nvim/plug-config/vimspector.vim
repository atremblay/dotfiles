nmap <leader>dn :call vimspector#StepOver()<cr>
nmap <leader>di :call vimspector#StepInto()<cr>
nmap <leader>do :call vimspector#StepOut()<cr>

nnoremap <leader>dc :call vimspector#Continue()<cr>
nnoremap <leader>ds :call vimspector#Launch()<cr>
nnoremap <leader>dx :call vimspector#Reset()<cr>
nnoremap <leader>ddb :call vimspector#Clearreakpoints()<cr>

nmap <leader>dr :call vimspector#Restart()<cr>
nmap <leader>drc :call vimspector#RunToCursor()<cr>
nmap <leader>db :call vimspector#ToggleBreakpoint()<cr>
nmap <leader>dcb :call vimspector#ToggleConditionalBreakPoint()<cr>

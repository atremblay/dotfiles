-- Same clipboard everywhere when using 'y' (for oscyank)
vim.cmd [[ autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif ]]

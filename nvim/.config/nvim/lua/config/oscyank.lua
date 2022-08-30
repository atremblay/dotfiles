-- Same clipboard everywhere when using 'y' (for oscyank)
--vim.cmd([[ autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif ]])
require("osc52").setup({
	max_length = 0, -- Maximum length of selection (0 for no limit)
	silent = false, -- Disable message on successful copy
	trim = false, -- Trim text before copy
})

vim.keymap.set("n", "<leader>y", require("osc52").copy_operator, { expr = true })
vim.keymap.set("n", "<leader>yy", "<leader>c_", { remap = true })
vim.keymap.set("x", "<leader>y", require("osc52").copy_visual)

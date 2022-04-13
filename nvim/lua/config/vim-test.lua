local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap("n", "t<C-n>", ":TestNearest<CR>", opts)
keymap("n", "t<C-f>", ":TestFile<CR>", opts)
keymap("n", "t<C-s>", ":TestSuite<CR>", opts)
keymap("n", "t<C-l>", ":TestLast<CR>", opts)
keymap("n", "t<C-g>", ":TestVisit<CR>", opts)

vim.cmd [[ let test#python#pytest#options = '--tb=short --durations=10 --pdb' ]]

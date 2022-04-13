
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

keymap("n", "<leader>dn", ":call vimspector#StepOver()<cr>", opts)
keymap("n", "<leader>di", ":call vimspector#StepInto()<cr>", opts)
keymap("n", "<leader>do", ":call vimspector#StepOut()<cr>", opts)


-- This block may need to be noremap. The original keymaps had noremap, but not sure why
keymap("n", "<leader>dc", ":call vimspector#Continue()<cr>", opts)
keymap("n", "<leader>ds", ":call vimspector#Launch()<cr>", opts)
keymap("n", "<leader>dx", ":call vimspector#Reset()<cr>", opts)
keymap("n", "<leader>ddb", ":call vimspector#Clearreakpoints()<cr>", opts)

keymap("n", "<leader>dr", ":call vimspector#Restart()<cr>", opts)
keymap("n", "<leader>drc", ":call vimspector#RunToCursor()<cr>", opts)
keymap("n", "<leader>db", ":call vimspector#ToggleBreakpoint()<cr>", opts)
keymap("n", "<leader>dcb", ":call vimspector#ToggleConditionalBreakPoint()<cr>", opts)

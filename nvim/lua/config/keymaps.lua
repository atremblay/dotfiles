local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
-- shorthand
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
--vim.g.mapleader = " "
--vim.g.maplocalleader = " "

-- Modes:
--     normal_mode = "n"
--     insert_mode = "i"
--     visual_mode = "v"
--     visual_block_mode = "x"
--     term_mode = "t"
--     command_mode = "c"

keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Make Y behave like it's supposed to
keymap("n", "Y", "y$", opts)

-- Keep cursor centered when searching things
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Add additional undo points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Nice remap to move lines around
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("i", "<C-j>", "<esc>:m .+1<CR>==", opts)
keymap("i", "<C-k>", "<esc>:m .-2<CR>==", opts)
keymap("n", "<leader>j", ":m .+1<CR>==", opts)
keymap("n", "<leader>k", ":m .-2<CR>==", opts)

-- Mapping to delete in the 'black hole' registry
keymap("n", "<leader>d", '"_d', opts)
keymap("x", "<leader>d", '"_d', opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Formatter
keymap("n", "<leader>p", ":Format<cr>", opts)

-- resize with vim bindings
keymap("n", "<A-C-k>", ":resize +3<CR>", opts)
keymap("n", "<A-C-j>", ":resize -3<CR>", opts)
keymap("n", "<A-C-h>", ":vertical resize -3<CR>", opts)
keymap("n", "<A-C-l>", ":vertical resize +3<CR>", opts)

-- Split navigation
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- Telescope

keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
--keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true }))<cr>", opts)
keymap("n", "<leader>rg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<C-b>", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)

-- Git
keymap("n", "]g", "<cmd>Gitsigns next_hunk<cr>", opts)
keymap("n", "[g", "<cmd>Gitsigns prev_hunk<cr>", opts)
keymap("n", "<leader>g", "<cmd>Gitsigns preview_hunk<cr>", opts)

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- stop yanking on paste in visual mode
keymap("v", "p", '"_dP', opts)

-- Telescope to vimrc files
keymap("n", "<leader>vrc", "<cmd>lua require('config/telescope').search_dotfiles()<cr>", opts)

-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny


lvim.plugins = {
    {"shaunsingh/nord.nvim"},
    {"EdenEast/nightfox.nvim"},
    {"rmehri01/onenord.nvim"},
    {"Shatur/neovim-ayu"},
}


-- shorthand
local o = vim.opt

-- NVIM OPTIONS
o.hlsearch = false
o.incsearch = true
o.backup = false -- creates a backup file
o.fileencoding = "utf-8" -- encoding yup
o.completeopt = {
    "menu",
    "menuone", -- menuone: popup menu even when only one match
    "noselect", -- noselect: force user to select from menu
}
o.clipboard = "unnamedplus" -- allows nvim to access sysyem clipboard
o.relativenumber = true -- show relative line numbers
o.number = true
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.swapfile = true -- creates a swapfile
o.expandtab = true -- spaces for tab
o.shiftwidth = 4 -- number of spaces for shift indent
o.tabstop = 4 -- number of spaces for tab
o.cursorline = true -- highlight current line
o.wrap = false -- line wrap
o.mouse = "a" -- allow mouse in nvim
o.ignorecase = true -- ignore case when searching (see smartcase)
o.smartcase = true -- override ignorecase when search pattern contains upper case characters
o.showmode = true -- show -- INSERT -- etc.
o.showtabline = 2 -- always show tabline
o.autoindent = true
o.smartindent = true -- indent smartly with new lines
o.smarttab = true
o.termguicolors = true -- set term gui colors (most terminals support this)
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.updatetime = 300 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.scrolloff = 10 -- have a few lines before reaching edge (amazing)
o.sidescrolloff = 10 -- same for sidescroll
o.signcolumn = "yes"

vim.g.python3_host_prog = os.getenv("HOME") .. "/miniconda3/envs/neovim/bin/python"

vim.cmd([[set iskeyword+=-]]) -- let - be part of "words"
--vim.cmd [[ autocmd BufWritePre *.py call black#Black() ]]



-- Keymaps
lvim.leader = "\\"

local opts = { noremap = true, silent = true }

-- shorthand
local keymap = vim.keymap.set

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
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("x", "<leader>p", [["_dP]])
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Add additional undo points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Nice remap to move lines around
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
--keymap("i", "<C-j>", "<esc>:m .+1<CR>==", opts)
--keymap("i", "<C-k>", "<esc>:m .-2<CR>==", opts)
--keymap("n", "<leader>j", ":m .+1<CR>==", opts)
--keymap("n", "<leader>k", ":m .-2<CR>==", opts)

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
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>rg", builtin.live_grep, opts)
vim.keymap.set("n", "<C-b>", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("rg > ") })
end, opts)

--keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
--keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true }))<cr>", opts)

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
-- need to leave the call as string because that function is initialized only in after/plugin
keymap("n", "<leader>vrc", "<cmd>lua require('telescope').search_dotfiles()<cr>", opts)

--keymap("n", "<leader>f", function()
--local _, _, p_root = vim.fn.expand("%:p"):find(string.format("(%s", os.getenv("HOME")) .. "/workspace/[^/]+/)")
--require("telescope.builtin").find_files({ cwd = p_root })
--end)

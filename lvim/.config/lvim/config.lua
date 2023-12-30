-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

require("options")
lvim.plugins = {
    { "shaunsingh/nord.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "rmehri01/onenord.nvim" },
    { "Shatur/neovim-ayu" },
}

-- shorthand
local o = vim.opt

-- use treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

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
--lvim.leader = "\\"
lvim.g.mapleader = ";"

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

--lvim.keys.insert_mode["jk"] = "<ESC>"
--lvim.keys.insert_mode["kj"] = "<ESC>"

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

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

--local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
--if not config_status_ok then
--return
--end

--local function open_nvim_tree(data)
---- buffer is a real file on the disk
--local real_file = vim.fn.filereadable(data.file) == 1

---- buffer is a [No Name]
--local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

--if not real_file and not no_name then
--return
--end

---- open the tree, find the file but don't focus it
--require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
--end

--vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup({ -- BEGIN_DEFAULT_OPTS
    on_attach = "default",
    hijack_cursor = false,
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = false,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    select_prompts = false,
    sort = {
        sorter = "name",
        folders_first = true,
        files_first = false,
    },
    view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        width = 30,
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        full_name = false,
        root_folder_label = ":~:s?$?/..?",
        indent_width = 2,
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
        highlight_git = false,
        highlight_diagnostics = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        highlight_bookmarks = "none",
        highlight_clipboard = "name",
        indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = false,
                    color = true,
                },
            },
            git_placement = "before",
            modified_placement = "after",
            diagnostics_placement = "signcolumn",
            bookmarks_placement = "signcolumn",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
                diagnostics = true,
                bookmarks = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "󰆤",
                modified = "●",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_root = false,
        ignore_list = {},
    },
    system_open = {
        cmd = "",
        args = {},
    },
    git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        disable_for_dirs = {},
        timeout = 400,
        cygwin_support = false,
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    modified = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    filters = {
        git_ignored = true,
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "shadow",
                style = "minimal",
            },
        },
        open_file = {
            quit_on_open = false,
            eject = true,
            resize_window = true,
            window_picker = {
                enable = true,
                picker = "default",
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "gio trash",
    },
    tab = {
        sync = {
            open = false,
            close = false,
            ignore = {},
        },
    },
    notify = {
        threshold = vim.log.levels.INFO,
        absolute_path = true,
    },
    help = {
        sort_by = "key",
    },
    ui = {
        confirm = {
            remove = true,
            trash = true,
        },
    },
    experimental = {},
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
})

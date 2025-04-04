local Util = require("lazyvim.util")
return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = vim.fn.executable("make") == 1,
            config = function()
                Util.on_load("telescope.nvim", function()
                    require("telescope").load_extension("fzf")
                end)
            end,
        },
    },
    keys = {
        {
            "<leader>,",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Switch Buffer",
        },
        { "<leader>/",       LazyVim.pick("live_grep"),                                       desc = "Grep (root dir)" },
        { "<leader>:",       "<cmd>Telescope command_history<cr>",                            desc = "Command History" },
        { "<leader><space>", LazyVim.pick("files"),                                           desc = "Find Files (root dir)" },
        -- find
        { "<leader>fb",      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",   desc = "Buffers" },
        { "<leader>fc",      LazyVim.pick.config_files(),                                     desc = "Find Config File" },
        { "<leader>ff",      LazyVim.pick("auto"),                                            desc = "Find Files (root dir)" },
        { "<leader>fF",      LazyVim.pick("auto", { root = false }),                          desc = "Find Files (cwd)" },
        { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                                   desc = "Recent" },
        { "<leader>fR",      LazyVim.pick("oldfiles", { cwd = vim.loop.cwd() }),              desc = "Recent (cwd)" },
        -- git
        { "<leader>gc",      "<cmd>Telescope git_commits<CR>",                                desc = "commits" },
        { "<leader>gs",      "<cmd>Telescope git_status<CR>",                                 desc = "status" },
        -- search
        { '<leader>s"',      "<cmd>Telescope registers<cr>",                                  desc = "Registers" },
        { "<leader>sa",      "<cmd>Telescope autocommands<cr>",                               desc = "Auto Commands" },
        { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",                  desc = "Buffer" },
        { "<leader>sc",      "<cmd>Telescope command_history<cr>",                            desc = "Command History" },
        { "<leader>sC",      "<cmd>Telescope commands<cr>",                                   desc = "Commands" },
        { "<leader>sd",      "<cmd>Telescope diagnostics bufnr=0<cr>",                        desc = "Document diagnostics" },
        { "<leader>sD",      "<cmd>Telescope diagnostics<cr>",                                desc = "Workspace diagnostics" },
        { "<leader>sg",      LazyVim.pick("live_grep"),                                       desc = "Grep (root dir)" },
        { "<leader>sG",      LazyVim.pick("live_grep", { cwd = false }),                      desc = "Grep (cwd)" },
        { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                                  desc = "Help Pages" },
        { "<leader>sH",      "<cmd>Telescope highlights<cr>",                                 desc = "Search Highlight Groups" },
        { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                                    desc = "Key Maps" },
        { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                                  desc = "Man Pages" },
        { "<leader>sm",      "<cmd>Telescope marks<cr>",                                      desc = "Jump to Mark" },
        { "<leader>so",      "<cmd>Telescope vim_options<cr>",                                desc = "Options" },
        { "<leader>sR",      "<cmd>Telescope resume<cr>",                                     desc = "Resume" },
        { "<leader>sw",      LazyVim.pick("grep_string", { word_match = "-w" }),              desc = "Word (root dir)" },
        { "<leader>sW",      LazyVim.pick("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
        { "<leader>sw",      LazyVim.pick("grep_string"),                                     mode = "v",                       desc = "Selection (root dir)" },
        { "<leader>sW",      LazyVim.pick("grep_string", { cwd = false }),                    mode = "v",                       desc = "Selection (cwd)" },
        { "<leader>uC",      LazyVim.pick("colorscheme", { enable_preview = true }),          desc = "Colorscheme with preview" },
        {
            "<leader>vrc",
            LazyVim.pick("files", {
                hidden = true,
                cwd = "~/dotfiles/",
                search_dirs = { "nvim/.config/nvim", "kitty", "tmux", "yabai", "skhd" },
            }),
            desc = "Colorscheme with preview",
        },
        {
            "<leader>fp",
            function()
                require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
            end,
            desc = "Find Plugin File",
        },
        {
            "<leader>ss",
            function()
                require("telescope.builtin").lsp_document_symbols({
                    symbols = require("lazyvim.config").get_kind_filter(),
                })
            end,
            desc = "Goto Symbol",
        },
        {
            "<leader>sS",
            function()
                require("telescope.builtin").lsp_dynamic_workspace_symbols({
                    symbols = require("lazyvim.config").get_kind_filter(),
                })
            end,
            desc = "Goto Symbol (Workspace)",
        },
    },
}

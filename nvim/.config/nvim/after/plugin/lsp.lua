vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons

local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "pyright",
    "rust_analyzer",
    "ruff_lsp",
})

lsp.nvim_workspace()

require("lspconfig").pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                reportUnknownArgumentType = "off",
                --reportOptionalMemberAccess=false,
                --reportUnknownMemberType=false,
                --reportOptionalMemberAccess=false,
            },
        },
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, remap = false, silent = true }

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
end)

lsp.configure("pyright", {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                reportUnknownArgumentType = "off",
                --reportOptionalMemberAccess=false,
                --reportUnknownMemberType=false,
                --reportOptionalMemberAccess=false,
            },
        },
    },
})
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

-- This needs to be setup after the LSP
require("mason").setup()
require("mason-nvim-dap").setup({
    automatic_setup = true,
    ensure_installed = { "python" },
    handlers = {},
})

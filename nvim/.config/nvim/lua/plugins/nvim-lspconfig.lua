local Util = require("lazyvim.util")
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<leader>dk", vim.diagnostic.goto_prev }
    keys[#keys + 1] = { "<leader>dj", vim.diagnostic.goto_next }
    keys[#keys + 1] = { "<leader>rn", vim.lsp.buf.rename }
    keys[#keys + 1] = { "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>" }
    keys[#keys + 1] = { "<leader>ca", vim.lsp.buf.code_action }
    keys[#keys + 1] = { "<leader>dl", "<cmd>Telescope diagnostics<cr>" }
  end,
  event = "LazyFile",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {} },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
}

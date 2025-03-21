return {
  "folke/which-key.nvim",
  enabled = false,
  opts = {
    spec = {
      { "<BS>", desc = "Decrement Selection", mode = "x" },
      { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
    },
  },
}

local colorscheme = "onenord"
return {
  { "rmehri01/onenord.nvim", lazy = false },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme,
    },
  },
  opts = function()
    require("lualine").setup({
      options = {
        theme = colorscheme,
      },
    })
  end,
}

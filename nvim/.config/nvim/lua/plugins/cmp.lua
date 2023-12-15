return {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        return
      end

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        return
      end

      local lspkind_status_ok, lspkind = pcall(require, "lspkind")
      if not lspkind_status_ok then
        return
      end

      require("luasnip/loaders/from_vscode").lazy_load()

      -- find more here: https://www.nerdfonts.com/cheat-sheet
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline", keyword_length = 5 },
          { name = "path" },
        },
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.mapping.confirm({
            behaviour = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = lspkind.cmp_format({
            with_text = true,
            mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            menu = {
              nvim_lsp = "[LSP]",
              nvim_lua = "[NVIM LUA]",
              luasnip = "[l-snip]",
              ultisnips = "[u-snip]",
              buffer = "[buf]",
              path = "[path]",
            },

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            --before = function (entry, vim_item)
            --return vim_item
            --end
          }),
        },
        sources = {
          { name = "luasnip" },
          { name = "ultisnips" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "buffer", keyword_length = 5 },
          { name = "path" },
          { name = "nvim_lsp_signature_help" },
          { name = "neorg" },
        },
        confirm = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        experimental = {
          ghost_text = false,
        },
        --view = {
        --entries = "native",
        --},
      })
    end,
  },
}

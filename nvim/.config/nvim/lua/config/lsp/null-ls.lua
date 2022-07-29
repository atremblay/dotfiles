local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- Need to have these binaries installed
-- See supported formatters and diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
null_ls.setup({
	debug = true,
	sources = {
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.isort.with({
			command = os.getenv("HOME") .. "/miniconda3/envs/neovim/bin/isort",
			extra_args = { "--sp", os.getenv("HOME") .. "/.isort.cfg" },
		}),
		formatting.black.with({
			command = os.getenv("HOME") .. "/miniconda3/envs/neovim/bin/black",
			extra_args = { "--fast", "--line-length", "88" },
		}),
		formatting.stylua,
		diagnostics.pylint.with({
			command = "pylint",
			extra_args = { "--rcfile", "~/.pylintrc", "-d", "C0411" },
		}),
	},
	-- This will apply formatting on save
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
        augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]])
		end
	end,
})

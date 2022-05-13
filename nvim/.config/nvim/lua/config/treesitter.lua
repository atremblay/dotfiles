local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "python", "markdown", "yaml", "json", "norg" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "python" } },
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aK"] = "@comment.outer",
				["ib"] = "@block.inner",
				["ab"] = "@block.outer",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["aC"] = "@class.outer",
				["iC"] = "@class.inner",
				["ic"] = "@conditional.inner",
				["ac"] = "@conditional.outer",
				["il"] = "@loop.inner",
				["al"] = "@loop.outer",
				["ik"] = "@call.inner",
				["ak"] = "@call.outer",
				["ip"] = "@parameter.inner",
				["ap"] = "@parameter.outer",
				["as"] = "@statement.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["sn"] = "@parameter.inner",
			},
			swap_previous = {
				["sp"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				-- ["]f"] = "@function.outer",
				-- ["]]"] = "@class.outer",
			},
			goto_next_end = {
				-- ["]e"] = "@function.outer",
				-- ["]["] = "@class.outer",
			},
			goto_previous_start = {
				-- ["[f"] = "@function.outer",
				-- ["[["] = "@class.outer",
			},
			goto_previous_end = {
				-- ["[e"] = "@function.outer",
				-- ["[]"] = "@class.outer",
			},
		},
	},
})

require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
			},
		},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
					gtd = "~/notes/gtd",
				},
			},
		},
		["core.norg.concealer"] = {},
		["core.gtd.base"] = {
			config = {
				workspace = "gtd",
			},
		},
		["core.gtd.ui"] = {},
		["core.gtd.helpers"] = {},
		["core.gtd.queries"] = {},
		["core.norg.completion"] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				engine = "nvim-cmp",
			},
		},
	},
})

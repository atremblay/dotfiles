require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
					example_gtd = "~/notes/example_workspaces/gtd",
				},
			},
		},
		["core.norg.concealer"] = {},
		["core.gtd.base"] = {
			config = {
				workspace = "example_gtd",
			},
		},
		["core.gtd.ui"] = {},
		["core.gtd.helpers"] = {},
		["core.gtd.queries"] = {},
	},
})

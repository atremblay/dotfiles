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
                    work = "~/Documents/notes/work",
                    home = "~/Documents/notes/home",
                    gtd = "~/Documents/notes/gtd",
                },
            },
        },
        ["core.norg.concealer"] = {},
        --["core.gtd.base"] = {
        --config = {
        --workspace = "gtd",
        --},
        --},
        --["core.gtd.ui"] = {},
        --["core.gtd.helpers"] = {},
        --["core.gtd.queries"] = {},
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp",
            },
        },
    },
})

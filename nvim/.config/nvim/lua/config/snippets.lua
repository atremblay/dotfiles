local ls = require("luasnip")
local s = ls.s
local t = ls.t
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("markdown", {
	s(
		"begin",
		fmt(
			[[
            \begin{{{}}}
                {}
            \end{{{}}}
                ]],
			{ i(1), i(0), rep(1) }
		)
	),
})

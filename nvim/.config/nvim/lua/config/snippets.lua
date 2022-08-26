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
	s(
		"pmat",
		fmt(
			[[
            \begin{{pmatrix}}
                {}
            \end{{pmatrix}}
            ]],
			{ i(0) }
		)
	),
	s(
		"bmat",
		fmt(
			[[
            \begin{{bmatrix}}
                {}
            \end{{bmatrix}}
            ]],
			{ i(0) }
		)
	),
	s("mk", fmt("${}$ {}", { i(1), i(0) })),
	s(
		"dm",
		fmt(
			[[
            $$
            {}
            $$
            ]],
			{ i(0) }
		)
	),
	s("//", fmt("\\frac{{{}}}{{{}}} {}", { i(1, "numerator"), i(2, "denominator"), i(0) })),
	s("part", fmt("\\frac{{partial {}}}{{partial {}}} {}", { i(1, "numerator"), i(2, "denominator"), i(0) })),
	s("lr(", fmt("\\left({}\\right) {}", { i(1), i(0) })),
	s("lr{", fmt("\\left{{{}\\right}} {}", { i(1), i(0) })),
})

#!/bin/env lua

local luasnip = require("luasnip")

luasnip.add_snippets("markdown", {
  luasnip.snippet({
    trig = "date",
    name = "Full Date",
    desc = "Date for fontmatter",
  }, {
    luasnip.text_node({os.date("%Y-%m-%dT%H:%m:%S%z")}),
  }),
})


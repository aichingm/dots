#!/bin/env lua

local luasnip = require("luasnip")

luasnip.add_snippets("go", {
  luasnip.snippet({
    trig = "iferr",
    name = "If Error",
    desc = "If err != nil Block",
  }, {
    luasnip.text_node({"if err != nil {", "\t"}),
    luasnip.insert_node(1),
    luasnip.text_node({"", "}"}),
  }),
})

local lua_snip = "lua"
require("luasnip.session.snippet_collection").clear_snippets(lua_snip)

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(lua_snip, {
  s("rq", fmt("local {} = require({}){}", { i(1), i(2), i(0) })),
})

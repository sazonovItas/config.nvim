local go_snip = "go"
require("luasnip.session.snippet_collection").clear_snippets(go_snip)

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(go_snip, {})

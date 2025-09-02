return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  config = function()
    local cmp = require "cmp"

    cmp.setup {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item {},
        ["<C-n>"] = cmp.mapping.select_next_item {},
        ["<C-y>"] = cmp.mapping.confirm { select = true },
      },
    }

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
        { name = "path" },
      },
    })

    cmp.setup.cmdline({ "/", "?" }, {
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item {},
        ["<C-n>"] = cmp.mapping.select_next_item {},
        ["<C-y>"] = cmp.mapping.confirm { select = true },
      },
      sources = {
        { name = "buffer" },
      },
    })
  end,
}

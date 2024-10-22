local M = {
  "hrsh7th/nvim-cmp",
  lazy = false,
  priority = 100,
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    vim.opt.shortmess:append "c"

    require "custom.snippet"

    local cmp = require "cmp"
    local lspkind = require "lspkind"
    cmp.setup {
      sources = {
        { name = "nvim_lsp", max_item_count = 15 },
        { name = "luasnip",  max_item_count = 10 },
        { name = "path" },
        { name = "buffer" },
        { name = "copilot",  group_index = 1,    priority = 100 },
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item {
          behavior = cmp.SelectBehavior.Insert,
        },
        ["<C-n>"] = cmp.mapping.select_next_item {
          behavior = cmp.SelectBehavior.Insert,
        },
        ["<C-y>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },

      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        format = lspkind.cmp_format {
          mode = "symbol_text",
          preset = "codicons",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
        },
      },

      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
    }

    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          max_item_count = 15,
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })

    -- `/`, `?` cmdline setup
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
  end,
}

return { M }

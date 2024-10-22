local M = {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",

      -- dbee completion, ui and vim-dabod
      {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
        "kristijanhusak/vim-dadbod-ui",
      },
    },
    build = function()
      require("dbee").install "go"
    end,
    config = function()
      local source = require "dbee.sources"
      require("dbee").setup {
        sources = {
          source.MemorySource:new({
            ---@diagnostic disable-next-line: missing-fields
            {
              type = "postgres",
              name = "mixery",
              url = "postgresql://itas:password@localhost:5432/mixery?sslmode=disable",
            },
          }, "mixery"),
        },
      }

      local set = vim.keymap.set

      set("n", "<leader>od", function()
        require("dbee").open()
      end)

      set("n", "<leader>db", ":DBUIToggle<CR>")
    end,
  },
}

return { M }

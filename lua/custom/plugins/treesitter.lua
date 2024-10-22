local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    lazy = false,
    config = function()
      local configs = require "nvim-treesitter.configs"

      ---@diagnostic disable-next-line: missing-fields
      configs.setup {
        ensure_installed = {
          "c",
          "bash",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "dockerfile",
          "proto",
          "sql",
          "toml",
          "yaml",
          "json",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}

return { M }

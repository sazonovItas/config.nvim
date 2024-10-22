local M = {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    lazy = false,

    config = function()
      require("kanagawa").setup {}
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,

    config = function()
      require("catppuccin").setup {}
    end,
  },
}

return { M }

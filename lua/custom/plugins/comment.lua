local M = {
  "numToStr/Comment.nvim",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("Comment").setup {}
  end,
}

return { M }

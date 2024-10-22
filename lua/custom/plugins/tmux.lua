local M = {
  "aserowy/tmux.nvim",
  config = function()
    local tmux = require "tmux"
    tmux.setup {}

    local set = vim.keymap.set

    -- windows resizing
    set("n", "<A-l>", function()
      tmux.resize_right()
    end)
    set("n", "<A-h>", function()
      tmux.resize_left()
    end)
    set("n", "<A-k>", function()
      tmux.resize_top()
    end)
    set("n", "<A-j>", function()
      tmux.resize_bottom()
    end)
  end,
}

return { M }

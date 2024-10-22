local M = {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      local builtin = require "telescope.builtin"
      local set = vim.keymap.set

      set("n", "<leader>ff", builtin.find_files, {})
      set("n", "<leader>fg", builtin.live_grep, {})
      set("n", "<leader>fb", builtin.buffers, {})
    end,
  },
}

return { M }

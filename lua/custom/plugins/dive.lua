return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local ui = require "custom.plugins.dive.ui"

    vim.api.nvim_create_user_command("DiveImage", function(args)
      ui.toggle_terminal("dive " .. args.fargs[1])
    end, { nargs = 1, desc = "Using dive to given image" })
  end,
}

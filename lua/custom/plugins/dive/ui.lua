local Terminal = require("toggleterm.terminal").Terminal

local M = {}

---@type Terminal|nil
local dive_term = nil

---Clear terminal terminal
---@return boolean
function M.clear_term()
  if dive_term and dive_term:is_open() then
    dive_term:close()
    dive_term = nil
    return true
  end

  return false
end

---Create terminal with the default config
---@param cmd string command to exexute in a terminal
---@return Terminal
function M.new_term(cmd)
  -- Create float terminal with custom command
  return Terminal:new {
    cmd = cmd,
    direction = "float",
    float_opts = { border = "double" },
    on_open = function(term)
      vim.cmd "startinsert!"
      vim.api.nvim_buf_set_keymap(
        term.bufnr,
        "n",
        "q",
        "<cmd>close<CR>",
        { noremap = true, silent = true }
      )
    end,
  }
end

---Toogle terminal with the given command
---@param cmd string command to execute
---@return nil
---@usage require("dive.ui").toggle_terminal(cmdToExecute)
function M.toggle_terminal(cmd)
  if M.clear_term() then
    return
  end

  -- Create float terminal and execute custom command
  dive_term = M.new_term(cmd)
  return dive_term:toggle()
end

return M

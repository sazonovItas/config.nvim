local M = {}

---Prints a message with a given hightlighting group
---@param message string a message to print
---@param highlight_group string|nil hightlighting group for a message
---@return nil
M.__print = function(message, highlight_group)
  vim.api.nvim_echo(
    { { "Divedocker: " .. message, highlight_group or "" } },
    true,
    {}
  )
end

---Prints a error message
---@param message string a message to print
---@return nil
M.error = function(message)
  M.__print(message, "ErrorMsg")
end

---Prints a warning message
---@param message string a message to print
---@return nil
M.warn = function(message)
  M.__print(message, "WarnMsg")
end

---Prints a info message
---@param message string a message to print
---@return nil
M.info = function(message)
  M.__print(message)
end

return M

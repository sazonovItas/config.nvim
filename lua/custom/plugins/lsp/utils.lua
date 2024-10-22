local M = {
  set_filetype = function(pattern, filetype)
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = pattern,
      command = "set filetype=" .. filetype,
    })
  end,
}

return M

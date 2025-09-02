return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofumpt", "golines", "goimports" },
      sh = { "shellharden" },
      cpp = { "clang-format" },
    },
  },
}

local servers = {
  luals = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, "stylua.toml", ".git" },
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
      },
    },
  },
  bashls = {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
  },
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "go.mod", "gowork" },
    root_markers = { "go.work", "go.mod", ".git" },
    settings = {
      gopls = {
        codelenses = {
          upgrade_dependency = false,
          gc_details = false,
          vendor = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeFuncParameters = true,
        },
        analyses = {
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
        },
        staticcheck = true,
        usePlaceHolders = true,
        semanticTokens = true,
      },
    },
  },
  clangd = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    root_markers = { ".clangd", "compile_commands.json", ".git" },
  },
  terraformls = {
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "tf" },
    root_markers = { ".terraform" },
  },
}

for name, config in pairs(servers) do
  if config == true then
    config = {}
  end

  vim.lsp.config[name] = config

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("custom.lsp", {}),
    callback = function(args)
      local builtin = require "telescope.builtin"

      vim.keymap.set("n", "grt", builtin.lsp_type_definitions)
      vim.keymap.set("n", "grd", builtin.lsp_definitions)

      vim.keymap.set("n", "gri", builtin.lsp_implementations)
      vim.keymap.set("n", "grr", builtin.lsp_references)

      vim.keymap.set("n", "gO", builtin.lsp_document_symbols)
      vim.keymap.set("n", "gD", builtin.diagnostics, { buffer = args.buf })

      -- create auto command for the formatter
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("custom.lsp", { clear = false }),
        buffer = args.buf,
        callback = function()
          require("conform").format { bufnr = args.buf }
        end,
      })
    end,
  })

  -- enable lsp server
  vim.lsp.enable(name)
end

-- setup diagnostic to display virtual text
vim.diagnostic.config {
  virtual_text = {
    source = "always",
    prefix = "*",
  },
  severity_sourt = true,
  float = {
    source = "always",
  },
}

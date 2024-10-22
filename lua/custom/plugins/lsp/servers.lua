local util = require "lspconfig.util"

local servers = {
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
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
        gofumpt = true,
        completeUnimported = true,
        usePlaceholders = true,
        semanticTokens = true,
        staticcheck = true,
      },
    },
  },
  clangd = {
    init_options = {
      clangdFileStatus = true,
    },
    filetypes = { "c", "cpp" },
  },
  lua_ls = {
    server_capabilities = {
      semanticTokenProvider = vim.NIL,
    },
  },
  bashls = {
    filetypes = { "zsh", "sh" },
  },
  dockerls = true,
  docker_compose_language_service = {
    filetypes = { "yaml.docker-compose" },
  },
  bufls = true,
  templ = true,
  pyright = {
    filetypes = { "python" },
    root_dir = util.root_pattern(
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "pyrightconfig.json",
      ".git"
    ),
    settings = {
      pyright = {
        exclude = { ".venv" },
        venvPath = ".",
        venv = ".venv",
      },
      python = {
        analysis = {
          autoImportCompletions = true,
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
}

return servers

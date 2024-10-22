local M = {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup {
        bind = true,
        handler_opts = {
          border = "double",
        },
        floating_window_off_x = vim.fn.wincol() + 15,
        floating_window_off_y = 0,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },

      { "j-hui/fidget.nvim", opts = {} },

      -- Autoformatting
      "stevearc/conform.nvim",

      -- Schema information
      "b0o/SchemaStore.nvim",
    },

    config = function()
      require("neodev").setup {}

      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local lspconfig = require "lspconfig"
      local servers = require "custom.plugins.lsp.servers"

      require("mason").setup {}
      local ensure_installed = {
        "stylua",
        "delve",
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      vim.list_extend(ensure_installed, servers_to_install)
      require("mason-tool-installer").setup {
        ensure_installed = ensure_installed,
      }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end

        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = assert(
            vim.lsp.get_client_by_id(args.data.client_id),
            "must have valid client"
          )

          local settings = servers[client.name]
          if type(settings) ~= "table" then
            settings = {}
          end

          local builtin = require "telescope.builtin"

          local set = vim.keymap.set
          set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
          set("n", "gR", builtin.lsp_references, { buffer = 0 })
          set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
          set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
          set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

          set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
        end,
      })

      local conform = require "conform"
      conform.setup {
        formatters_by_ft = {
          lua = { "stylua" },
          go = { "gofumpt", "goimports", "golines" },
        },
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          conform.format {
            bufnr = args.buf,
            lsp_fallback = true,
            quiet = true,
          }
        end,
      })

      local utils = require "custom.plugins.lsp.utils"

      -- fix docker-compose filtype
      utils.set_filetype({
        "docker-compose.yml",
        "docker-compose.yaml",
        "compose.yml",
        "compose.yaml",
        "compose.dev.yml",
        "compose.dev.yaml",
      }, "yaml.docker-compose")

      -- fix toml filetype
      utils.set_filetype({ "*.service" }, "toml")
    end,
  },
}

return { M }

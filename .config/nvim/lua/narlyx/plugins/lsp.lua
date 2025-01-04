return {
  { -- Installer
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  { -- LSP translation layer
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jdtls", "gradle_ls", "pylsp", "gopls" },
      })
    end,
  },
  { -- LSP
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      local globalConfig = { capabilities = capabilities }
      lspconfig.lua_ls.setup(globalConfig)
      lspconfig.jdtls.setup(globalConfig)
      lspconfig.pylsp.setup(globalConfig)
      lspconfig.gopls.setup(globalConfig)

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
  { -- LS translation layer
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "google_java_fornmat", "black", "isort" },
      })
    end,
  },
  { -- Formatting & linting
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.google_java_format,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
        },
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}

-- LSP configuration using nvim-lspconfig
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/lazydev.nvim", opts = {} },
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Set global defaults for all LSP servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- Configure TypeScript/JavaScript server
    vim.lsp.config("tsgo", {
      root_dir = function(bufnr, on_dir)
        local root_markers = {
          "package-lock.json",
          "yarn.lock",
          "pnpm-lock.yaml",
          "bun.lockb",
          "bun.lock",
          ".git",
        }
        on_dir(vim.fs.root(bufnr, root_markers) or vim.fn.getcwd())
      end,
      settings = {
        typescript = {
          preferences = {
            includeCompletionsForModuleExports = true,
            includePackageJsonAutoImports = "on",
          },
          format = {
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          },
          suggest = {
            autoImports = true,
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
          },
        },
        javascript = {
          preferences = {
            includeCompletionsForModuleExports = true,
            includePackageJsonAutoImports = "on",
          },
          format = {
            insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
          },
          suggest = {
            autoImports = true,
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
          },
        },
      },
    })

    vim.lsp.config("graphql", {
      filetypes = {
        "graphql",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      root_dir = function(bufnr, on_dir)
        local graphql_root_markers = {
          ".graphqlrc",
          ".graphqlrc.json",
          ".graphqlrc.yml",
          ".graphqlrc.yaml",
          ".graphqlrc.js",
          ".graphqlrc.ts",
          ".graphql.config.js",
          ".graphql.config.ts",
          "graphql.config.js",
          "graphql.config.ts",
          "package-lock.json",
          "yarn.lock",
          "pnpm-lock.yaml",
          "bun.lockb",
          "bun.lock",
          ".git",
        }
        on_dir(vim.fs.root(bufnr, graphql_root_markers) or vim.fn.getcwd())
      end,
    })

    -- Enable all configured LSPs
    vim.lsp.enable({
      "graphql",
      "tsgo",
    })
  end,
}

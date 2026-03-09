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
    vim.lsp.config("ts_ls", {
      root_dir = function(bufnr, on_dir)
        local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
        root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
          or vim.list_extend(root_markers, { ".git" })
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

    -- Keep Biome for web/json formats, but avoid JS/TS completion conflicts with TypeScript LSP.
    vim.lsp.config("biome", {
      filetypes = { "astro", "css", "graphql", "html", "json", "jsonc", "svelte", "vue" },
    })

    -- Prefer ts_ls for TS import completion reliability.
    pcall(vim.lsp.enable, "tsgo", false)
    vim.lsp.enable("ts_ls")
  end,
}

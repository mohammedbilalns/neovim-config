-- Mason configuration for package management
-- Handles installation of LSP servers, DAP adapters, linters, and formatters
return {
  "williamboman/mason.nvim",
  config = function(_, opts)
    require("mason").setup(opts)
  end,
  opts = {
    ensure_installed = {
      -- LSP Servers
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "emmet_ls",
      "prismals",
      "gopls",
      "rust_analyzer",
      "astro",

      -- DAP Adapters
      "js-debug-adapter",
      "delve",

      -- Linters and Formatters
      "eslint",
      "ruff",
    },
  },
}

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
      "typescript-language-server",
      "graphql-language-service-cli",
      "html-lsp",
      "css-lsp",
      "tailwindcss-language-server",
      "lua-language-server",
      "emmet-language-server",
      "prisma-language-server",
      "gopls",
      "rust-analyzer",
      "astro-language-server",

      -- DAP Adapters
      "js-debug-adapter",
      "delve",

      -- Linters and Formatters
      "eslint-lsp",
      "prettier",
      "ruff",
    },
  },
}

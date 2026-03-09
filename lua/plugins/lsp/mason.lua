return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    automatic_enable = {
      exclude = { "tsgo" },
    },
    ensure_installed = {
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "emmet_ls",
      "prismals",
      "ruff",
      "eslint",
      "gopls",
      "rust_analyzer",
      "astro",
    },
  },
}

-- Mason-lspconfig integration
-- Automatically enables LSP servers installed via Mason
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
  },
}

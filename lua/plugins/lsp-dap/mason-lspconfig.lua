-- Mason-lspconfig integration
-- Automatically enables LSP servers installed via Mason
return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    handlers = {
      function(server_name)
        if server_name ~= "ts_ls" then
          require("lspconfig")[server_name].setup({})
        end
      end,
    },
  },
}

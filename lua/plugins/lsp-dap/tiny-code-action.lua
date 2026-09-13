return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    {
      "folke/snacks.nvim",
      opts = {
        terminal = {},
      }
    }
  },
  event = "LspAttach",
  opts = {
    backend = "delta",
    picker = "snacks",
  },
  keys = {
    {
      "<leader>ca",
      function()
        require("tiny-code-action").code_action()
      end,
      mode = { "n", "v" },
      desc = "Code Action",
    },
  },
}

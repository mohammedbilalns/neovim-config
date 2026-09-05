return {
  "chrisgrieser/nvim-chainsaw",
  event = "VeryLazy",
  opts = {}, -- required even if left empty
  keys = {
    { "<leader>lgv", function() require("chainsaw").variableLog() end, desc = "Chainsaw: Log variable", mode = { "n", "x" } },
    { "<leader>lgo", function() require("chainsaw").objectLog() end, desc = "Chainsaw: Log object", mode = { "n", "x" } },
  },
}

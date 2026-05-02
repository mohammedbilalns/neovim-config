return {
  "danymat/neogen",
  config = true,
  keys ={
    { "<leader>gc", function() require("neogen").generate() end, desc = "Generate Comment" }
  }
}

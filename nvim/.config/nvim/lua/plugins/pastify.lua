return {
  "TobinPalmer/pastify.nvim",
  cmd = { "Pastify", "PastifyAfter" },
  config = function()
    require("pastify").setup({
      opts = {
        apikey = "b6398df3ccbbdbe570799f4ebae5cbd6", -- Needed if you want to save online.
      },
    })
  end,
}

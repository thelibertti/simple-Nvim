return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},

  config = function () --configuration
    require("ibl").setup()
  end
}

--ready for alpha 0.3

return {
  "NvChad/nvim-colorizer.lua",
  event = "VeryLazy",

  config = function()
    require 'colorizer'.setup({
      mode = "background", css = true
    })
  end
}

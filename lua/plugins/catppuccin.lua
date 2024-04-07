return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", --change 'flavour' in order to use a different theme
      transparent_background = true,
    })
     vim.cmd.colorscheme "catppuccin"
    end
  }
}

--ready for alpha 0.3 

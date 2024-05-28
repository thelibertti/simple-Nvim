-- This looks good for alpha 0.5

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({

      color_overrides = {
		      mocha = {
			      rosewater = "#efc9c2",
			      flamingo = "#ebb2b2",
			      pink = "#f2a7de",
			      mauve = "#b889f4",
			      red = "#ea7183",
			      maroon = "#ea838c",
			      peach = "#f39967",
			      yellow = "#eaca89",
			      green = "#0bd34a",
			      teal = "#78cec1",
			      sky = "#91d7e3",
			      sapphire = "#68bae0",
			      blue = "#739df2",
			      lavender = "#a0a8f6",
			      text = "#a0b2b4",
			      subtext1 = "#a6b0d8",
			      subtext0 = "#959ec2",
			      overlay2 = "#848cad",
			      overlay1 = "#717997",
			      overlay0 = "#63677f",
			      surface2 = "#505469",
			      surface1 = "#3e4255",
			      surface0 = "#2c2f40",
			      base = "#1a1c2a",
			      mantle = "#141620",
			      crust = "#0e0f16",
		      },
	    },
      transparent_background = true,
      default_integrations = true,
    })
     vim.cmd.colorscheme "catppuccin"

  end
}

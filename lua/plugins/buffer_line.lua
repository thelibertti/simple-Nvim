return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "stevearc/resession.nvim"
  },
  config = function()
    require("cokeline").setup({
      show_if_buffers_are_at_least = 2,
    })
  end
}

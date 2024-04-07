return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup()

      require("mason-lspconfig").setup_handlers{
        function (server_name)
          require("lspconfig")[server_name].setup{
            capabilities = capabilities
          }
        end
        -- if you need you can other handlers than the 
        -- default ones run 
        -- :h mason-lspconfig-automatic-server-setup
        -- for more information

      } -- end of handler configuration

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    end,
  },
}
--ready for alpha 0.3

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
        end,
        --NOTE: if you need you can add other handlers than the 
        --NOTE: default ones run 
        --NOTE: :h mason-lspconfig-automatic-server-setup
        --NOTE: for more information

      } -- end of handler configuration

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    end,
  },
}

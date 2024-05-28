return {
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      local lsp_symbols = {
        Text = "   (Text) ",
        Method = "  (Method)",
        Function = " 󰊕  (Function)",
        Constructor = "   (Constructor)",
        Field = "   (Field)",
        Variable = "[] (Variable)",
        Class = "   (Class)",
        Interface = "   (Interface)",
        Module = "   (Module)",
        Property = "  (Property)",
        Unit = "   (Unit)",
        Value = "   (Value)",
        Enum = "  (Enum)",
        Keyword = "   (Keyword)",
        Snippet = "   (Snippet)",
        Color = "   (Color)",
        File = "   (File)",
        Reference = "   (Reference)",
        Folder = "   (Folder)",
        EnumMember = "   (EnumMember)",
        Constant = "   (Constant)",
        Struct = "   (Struct)",
        Event = "   (Event)",
        Operator = "   (Operator)",
        TypeParameter = " 󰉺  (TypeParameter)",
      }

      cmp.setup({

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        sources = {
          { name = "buffer" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },

      mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),

      formatting = {
        format = function(entry, item)
            item.kind = lsp_symbols[item.kind]
            item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
            })[entry.source.name]

            return item
        end,
      },
    })
    end,
  },
}

return {
  'maxmx03/solarized.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = 'dark'

    require('solarized').setup({
      transparent = false,
      palette = 'solarized',
      styles = {
        comments = {},
        functions = {},
        variables = {},
        numbers = {},
        constants = {},
        parameters = {},
        keywords = {},
        types = {},
      },
      enables = {
        bufferline = true,
        cmp = true,
        diagnostic = true,
        dashboard = true,
        editor = true,
        gitsign = true,
        hop = true,
        indentblankline = true,
        lsp = true,
        lspsaga = true,
        navic = true,
        neogit = true,
        neotree = true,
        notify = true,
        noice = true,
        semantic = true,
        syntax = true,
        telescope = true,
        tree = true,
        treesitter = true,
        todo = true,
        whichkey = true,
        mini = true,
      },
      highlights = {},
      colors = {},
      theme = 'default',
      autocmd = true,
    })

    vim.cmd.colorscheme = 'solarized'
  end
}

--function to get the LSP information
local function lsp_status()
  ---@type string
  local msg = 'No Active LSP'
  ---@type table
  local buf_ft = vim.api.nvim_get_option_value('filetype', {})
  ---@type table
  local clients = vim.lsp.get_clients()

  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end
--end  of function


-- Table tha contains the styles for the elements
-- that are being displayed into lua line  --
local options = {
  icons_enabled = true,
  theme = 'auto',
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
  disabled_filetypes = {
    statusline = {},
    winbar = {},
  },
  ignore_focus = {},
  always_divide_middle = true,
  globalstatus = false,
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  }
}

local mode_config = {
  'mode',
  'joa'
}

local git_info_config = {
  'branch',
  'diff',
  'diagnostics'
}

local filename = {
  {
    'filename',
    icon = { '', color = { fg = '#0177a0' } }
  }
}

local lsp_confi = {
  'filetype',
  { lsp_status, icon = ' LSP:', color = { gui = 'bold' } }
}
-- end of table configuration --

-- shequeme of the configuration
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    require('lualine').setup {
      options = options,
      sections = {
        lualine_a = mode_config,
        lualine_b = git_info_config,
        lualine_c = filename,
        lualine_x = lsp_confi,
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}

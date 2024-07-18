--banner and main screen
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[  ____                      __                                         ]],
      [[ |  _ \           ___      / _|                                        ]],
      [[ | |_) |_   _    ( _ )    | |_ ___  _ __    _   _ ___  ___ _ __ ___    ]],
      [[ |  _ <| | | |   / _ \/\  |  _/ _ \| '__|  | | | / __|/ _ \ '__/ __|   ]],
      [[ | |_) | |_| |  | (_>  <  | || (_) | |     | |_| \__ \  __/ |  \__ \   ]],
      [[ |____/ \__, |   \___/\/  |_| \___/|_|      \__,_|___/\___|_|  |___/   ]],
      [[         __/ |                                                         ]],
      [[        |___/                                                          ]],
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
      dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  > Settings", ":cd ~/.config/nvim/ | Telescope find_files<CR>"),
      dashboard.button("q", "󰗼  > Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
  end,
}

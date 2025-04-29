return {
  {
    "samharju/synthweave.nvim"
  },
  {
    "sphamba/smear-cursor.nvim"
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local list = require("cryptowatch").setup({})
      opts.sections.lualine_z = list
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "night",
      -- transparent = true,
      -- transparent_sidebar = true,
      styles = {
        -- sidebars = "transparent",
        -- floats = "transparent",
      },
      on_colors = function(colors)
        -- colors.bg_statusline = colors.none
        -- colors.bg_dark = colors.none
        -- colors.bg = colors.none
        -- colors.fg_dark = colors.none
        -- colors.fg = colors.none
      end,
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        width = 60,
        row = nil, -- dashboard position. nil for center
        col = nil, -- dashboard position. nil for center
        pane_gap = 4, -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        -- These settings are used by some built-in sections
        preset = {
          -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          -- Used by the `header` section
          header = [[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣷⣿⢸⡸⢻⣸⡄⠀⢸⣿⣿⣼⣦⣄⣀⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠀⠀⣼⡼⡜⢰⠃⠀⠀⣾⣿⡞⡼⠀⠀⠀⠀⢰⢇⣿⢹⢁⡇⠀⠀⡟⣸⣿⠆⢀⢣⠇⢸⡇
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠘⡇⡟⣇⡇⠀⢸⣿⡇⣿⡏⠀⠀⣿⢦⡀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀⢀⣿⢳⢃⡏⠀⠀⢰⣿⣿⣳⠃⠀⠀⠀⠀⡾⢸⣇⡏⢸⡿⠀⢸⢣⣿⡟⠀⣸⡟⢀⡿⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣻⢻⣹⣽⡀⢸⣿⢿⣟⠉⢽⡗⢿⣌⢳⡀⠀⠀⠀⠀⠀⠀⡿⠀⠀⣼⣯⡏⣼⠃⠀⢀⣿⢿⣿⠏⠀⠀⠀⠀⣼⢁⡿⡾⠁⣾⠃⢀⣧⣿⣿⠃⢰⣿⢁⣾⠇⢰
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣻⣿⣧⠈⣿⡼⣿⠀⡞⠀⡾⢿⣷⣷⡀⠀⠀⠀⠀⣸⠃⠀⢰⣿⡾⣼⡟⠀⠀⣸⣏⣾⡟⠀⠀⠀⢀⣠⠃⣾⣻⠃⣼⡏⢀⣾⣿⣳⠏⣠⡿⢃⣾⠟⢠⠏
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣷⣽⣷⡈⢳⡇⠀⡇⠸⣿⣿⣧⠀⠀⠀⢰⠇⣰⢠⡿⣻⣿⠿⠁⣤⠴⣿⣿⣿⣶⡖⠤⠴⣼⣧⣾⣱⣃⡼⣏⣤⢾⣟⡿⠁⣰⠟⣡⢿⠏⣰⠏⡴
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⢻⠀⠀⠀⢸⠁⠀⠙⢄⣀⣼⠙⠀⠀⠀⠏⠘⣿⠟⠛⢿⠏⠀⠀⡗⠀⢿⣿⡿⢹⡇⠴⠒⠚⠙⠁⠀⠀⠀⠙⢆⢸⡏⠀⠚⣡⡾⠛⣣⠞⢁⡼⢁
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢻⣸⡆⠀⠀⢸⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⢷⡀⠀⠀⣠⢾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣘⡾⠀⣀⣠⡁⣀⣸⠧⠴⠛⢀⡞
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠈⠃⡇⠀⠀⠸⢦⣀⣀⡀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⠈⠉⠉⠁⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡇⢀⢰⣿⠟⠋⠁⠀⠙⣾⡇⠋⢀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢰⠇⠚⠛⠓⠀⠀⠄⠉⠑⠃⢀⣀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⠀⠀⠀⠀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⠟⠁⠀⣠⣶⠶⣦⢸⡅⠀⢺
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡞⠀⢀⣠⣤⣖⣒⣶⣖⣲⡾⣯⣁⠀⠀⠀⠀⠀⠀⠀⠓⠒⠒⠒⠒⠒⠦⠤⠴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠃⠀⢠⢾⡷⠁⠀⢸⢸⠃⠀⣸
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣼⡿⢯⠁⠀⠀⠀⠀⠀⠈⠉⠳⢯⣳⣄⡀⠀⠀⠀⠀⠈⠁⠀⠛⠿⠿⠿⠷⣶⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣏⡈⠳⠤⢀⡼⣾⣧⣾⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⢹⠃⢸⠏⢹⢳⠈⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠙⠿⠤⠀⠀⠀⠀⠀⠀⠀⠀⣟⠓⣄⠀⠈⢁⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣠⣴⣾⣷⣈⣩⣵⣏⣤⣇⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⣄⣄⡚⣰⠇⠀⠀⣼⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠉⠀⢠⠋⠀⢠⠛⢻⡟⠉⠁⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣏⣀⣀⡶⠋⠁⠀⢠⣾⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣠⢒⣺⣶⣤⡷⢤⣾⠇⢀⣀⣀⣀⣀⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠁⠀⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⠿⠿⢿⡿⠛⢻⠏⠉⠉⡽⠋⢛⣦⣬⣽⣟⠿⠯⠽⠗⠒⢲⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⣄⣀⣀⣀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠋⠀⠀⠀⠀⠀⠀⠀⠀⢸⡤⠒⢲⣥⡄⣟⣀⣼⡏⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⢀⠔⠉⢙⣻⣿⠛⠉⠚⠛⠉⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⢶⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠢⠤⣄⠀⠀⠀⢸⣤⢤⣏⣨⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣀⣀⠀⠠⠤⠤⠴⠒⠛⠉⠀⢀⡾⣄⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
]],
        },
        -- item field formatters
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
  -- {
  --   "nvimdev/dashboard-nvim",
  --   lazy = false,
  --   opts = function()
  --     -- local dashboard = require("alpha.themes.dashboard")
  --     local logo = {
  --       [[_____________________________________________________________________]],
  --       [[|_|_______|_______|______ '__  ___|_______|_______|_______|_______|_|]],
  --       [[|     |       |       |   |  )      /         |       |       |     |]],
  --       [[|_____|_______|_______|__ |,' , .  | | _ , ___|_______|_______|_____|]],
  --       [[| |       |       |      ,|   | |\ | | ,' |       |       |       | |]],
  --       [[|_|_______|_______|____ ' | _ | | \| |'\ _|_______|_______|_______|_|]],
  --       [[|_____|_______|_______|_  ,-'_ _____ | _______|_______|_______|_____|]],
  --       [[| |       |       |   ,-'|  _     |       |       |       |       | |]],
  --       [[|_|_______|_______|__  ,-|-' |  ,-. \ /_.--. _____|_______|_______|_|]],
  --       [[|     |       |          |   |  | |  V  |   ) |       |       |     |]],
  --       [[|_____|_______|_______|_ | _ |-'`-'  |  | ,' _|_______|_______|_____|]],
  --       [[| |       |       |      |        |  '  ;'        |       |       | |]],
  --       [[|_|_______|_______|______"|_____  _,- o'__|_______|_______|_______|_|]],
  --       [[|     |       |       |       _,-'    .       |       |       |     |]],
  --       [[|_____|_______|_______|_ _,--'\      _,-'_____|_______|_______|_____|]],
  --       [[| |       |       |     '     ||_||-' _   |       |       |       | |]],
  --       [[|_|_______|_______|_______|__ || ||,-'  __|_______|_______|_______|_|]],
  --       [[|     |       |       |       |  ||_,-'       |       |       |     |]],
  --       [[|_____|_______|______.|_______.__  ___|_______|_______|_______|_____|]],
  --       [[| |       |       |   \          /        |       |       |       | |]],
  --       [[|_|_______|_______|___ \ __|___ /,  _ |   | ______|_______|_______|_|]],
  --       [[|     |       |       | \  ∧   // \   |   |   |       |       |     |]],
  --       [[|_____|_______|_______|_ \/ \ //--'\  |   | __|_______|_______|_____|]],
  --       [[| |       |       |       `  V/    |  |-' |__,    |       |       | |]],
  --       [[|_|_______|_______|_______|_______ _______'_______|_______|_______|_|]],
  --       [[|     |       |       |       |       |       |       |       |     |]],
  --       [[|_____|_______|_______|_______|_______|_______|_______|_______|_____|]],
  --       [[|_________|_______|_______|_______|_______|_______|_______|_______|_|]],
  --     }
  --
  --     local opts = {
  --       theme = "doom",
  --       hide = {
  --         -- this is taken care of by lualine
  --         -- enabling this messes up the actual laststatus setting after loading a file
  --         statusline = false,
  --       },
  --       config = {
  --         header = logo,
  --         -- stylua: ignore
  --         center = {
  --           { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
  --           { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
  --           { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
  --           { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
  --           { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
  --           { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
  --           { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
  --           { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
  --           { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
  --         },
  --         footer = function()
  --           local stats = require("lazy").stats()
  --           local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  --           return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
  --         end,
  --       },
  --     }
  --
  --     for _, button in ipairs(opts.config.center) do
  --       button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  --       button.key_format = "  %s"
  --     end
  --
  --     -- close Lazy and re-open when the dashboard is ready
  --     if vim.o.filetype == "lazy" then
  --       vim.cmd.close()
  --       vim.api.nvim_create_autocmd("User", {
  --         pattern = "DashboardLoaded",
  --         callback = function()
  --           require("lazy").show()
  --         end,
  --       })
  --     end
  --
  --     return opts
  --     -- dashboard.section.header.val = logo
  --     -- dashboard.opts.layout[1].val = 3
  --   end,
  -- },
}

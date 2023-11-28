return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local list = require("cryptowatch").setup({})
      opts.sections.lualine_z = list
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      -- local dashboard = require("alpha.themes.dashboard")
      local logo = {
        [[_____________________________________________________________________]],
        [[|_|_______|_______|______ '__  ___|_______|_______|_______|_______|_|]],
        [[|     |       |       |   |  )      /         |       |       |     |]],
        [[|_____|_______|_______|__ |,' , .  | | _ , ___|_______|_______|_____|]],
        [[| |       |       |      ,|   | |\ | | ,' |       |       |       | |]],
        [[|_|_______|_______|____ ' | _ | | \| |'\ _|_______|_______|_______|_|]],
        [[|_____|_______|_______|_  ,-'_ _____ | _______|_______|_______|_____|]],
        [[| |       |       |   ,-'|  _     |       |       |       |       | |]],
        [[|_|_______|_______|__  ,-|-' |  ,-. \ /_.--. _____|_______|_______|_|]],
        [[|     |       |          |   |  | |  V  |   ) |       |       |     |]],
        [[|_____|_______|_______|_ | _ |-'`-'  |  | ,' _|_______|_______|_____|]],
        [[| |       |       |      |        |  '  ;'        |       |       | |]],
        [[|_|_______|_______|______"|_____  _,- o'__|_______|_______|_______|_|]],
        [[|     |       |       |       _,-'    .       |       |       |     |]],
        [[|_____|_______|_______|_ _,--'\      _,-'_____|_______|_______|_____|]],
        [[| |       |       |     '     ||_||-' _   |       |       |       | |]],
        [[|_|_______|_______|_______|__ || ||,-'  __|_______|_______|_______|_|]],
        [[|     |       |       |       |  ||_,-'       |       |       |     |]],
        [[|_____|_______|______.|_______.__  ___|_______|_______|_______|_____|]],
        [[| |       |       |   \          /        |       |       |       | |]],
        [[|_|_______|_______|___ \ __|___ /,  _ |   | ______|_______|_______|_|]],
        [[|     |       |       | \  ∧   // \   |   |   |       |       |     |]],
        [[|_____|_______|_______|_ \/ \ //--'\  |   | __|_______|_______|_____|]],
        [[| |       |       |       `  V/    |  |-' |__,    |       |       | |]],
        [[|_|_______|_______|_______|_______ _______'_______|_______|_______|_|]],
        [[|     |       |       |       |       |       |       |       |     |]],
        [[|_____|_______|_______|_______|_______|_______|_______|_______|_____|]],
        [[|_________|_______|_______|_______|_______|_______|_______|_______|_|]],
      }

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = logo,
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
            { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
      -- dashboard.section.header.val = logo
      -- dashboard.opts.layout[1].val = 3
    end,
  },
}

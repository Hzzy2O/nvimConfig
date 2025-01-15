return {
  "mg979/vim-visual-multi",
  "0xmovses/move.vim",
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
    },
    config = function()
      require("sg").setup({})
    end,
    build = "nvim -l build/init.lua",
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      return {
        cursor = {
          enable = false,
        },
        scroll = {
          enable = false,
        },
      }
    end,
  },
  {
    "Hzzy2O/cryptowatch.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      coins = {
        { coin = "SUI" },
        { coin = "ACT" },
        { coin = "SOL" },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      open_mapping = [[<c-\>]],
      shade_terminals = false,
    },
    keys = {
      { [[<C-\>]] },
      { "<M-1>", "<Cmd>ToggleTerm direction=horizontal name=hor<Cr>", desc = "Terminal Horizontal" },
      {
        "<M-2>",
        "<cmd>ToggleTerm direction=float name=flo<cr>",
        desc = "Terminal Float",
      },
      {
        "<M-3>",
        "<cmd>ToggleTerm size=55 direction=vertical name=ver<cr>",
        desc = "Terminal Vertical",
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
    lazy = false,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = { inc_rename = true },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup({})
    end,
  },
}

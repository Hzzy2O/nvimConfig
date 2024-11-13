return {
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
    },
    config = function()
      -- local shell = require("utils").is_windows ?
      require("sg").setup({})
    end,

    -- If you have a recent version of lazy.nvim, you don't need to add this!
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
    "nvim-lua/plenary.nvim",
  },
  {
    "Hzzy2O/cryptowatch.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      coins = {
        { coin = "BTC" },
        { coin = "ETH" },
        { coin = "SOL" },
      },
    },
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      -- local shell = require("utils").is_windows ?
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        shade_terminals = false,
        -- add --login so ~/.zprofile is loaded
        -- https://vi.stackexchange.com/questions/16019/neovim-terminal-not-reading-bash-profile/16021#16021
        -- shell = "fish",
      })
    end,
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
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      -- add any options here
    },
    lazy = false,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })
      end,
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
  },
  {
    "0xmovses/move.vim",
  },
}

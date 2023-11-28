return {
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
      {
        "nvim-lua/plenary.nvim",
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
        -- shell = "pwsh.exe -NoLogo",
      })
    end,
    keys = {
      { [[<C-\>]] },
      { "<M-1>", "<Cmd>ToggleTerm size=40 direction=horizontal<Cr>", desc = "Terminal Horizontal" },
      {
        "<M-2>",
        "<cmd>ToggleTerm size=20 direction=float<cr>",
        desc = "Terminal Float",
      },
      {
        "<M-3>",
        "<cmd>ToggleTerm size=55 direction=vertical<cr>",
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
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   config = function()
  --     require("lsp_signature").setup({
  --       doc_lines = 0,
  --     })
  --   end,
  -- },
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
}

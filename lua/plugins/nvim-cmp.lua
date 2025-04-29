return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "rafamadriz/friendly-snippets" },
    -- use a release tag to download pre-built binaries
    version = "*",
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = "super-tab",
        -- ["<Up>"] = { "select_prev", "fallback" },
        -- ["<Down>"] = { "select_next", "fallback" },
        -- ["<C-N>"] = {
        --   "snippet_forward",
        --   "fallback",
        -- },
        -- ["<C-P>"] = {
        --   "snippet_backward",
        --   "fallback",
        -- },
        -- ["<C-J>"] = { "select_next", "fallback" },
        -- ["<C-K>"] = { "select_prev", "fallback" },
        -- ["<C-U>"] = { "scroll_documentation_up", "fallback" },
        -- ["<C-D>"] = { "scroll_documentation_down", "fallback" },
        -- ["<C-E>"] = { "hide", "fallback" },
        -- ["<CR>"] = { "accept", "fallback" },
        -- ["<Tab>"] = {
        --   function(cmp)
        --     if cmp.windows.autocomplete.win:is_open() then
        --       return cmp.accept()
        --     end
        --   end,
        --   "fallback",
        -- },
        -- ["<S-Tab>"] = {
        --   function(cmp)
        --     if cmp.windows.autocomplete.win:is_open() then
        --       return cmp.select_prev()
        --     end
        --   end,
        --   "fallback",
        -- },
        ["<C-f>"] = {
          function(cmp)
            cmp.show({ providers = { "snippets" } })
          end,
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}

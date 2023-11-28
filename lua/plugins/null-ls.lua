return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.eslint_d,
        nls.builtins.formatting.prettier.with({
          condition = function(utils)
            local has_file = utils.root_has_file({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yaml",
              ".prettierrc.yml",
              ".prettierrc.js",
              "prettier.config.js",
            })
            return has_file
          end,
        }),

        -- nls.builtins.diagnostics.flake8,
      },
      -- methods = {
      --   code_actions = {
      --
      --   }
      -- }
    }
  end,
}

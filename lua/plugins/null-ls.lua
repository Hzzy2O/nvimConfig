return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  opts = function()
    local nls = require("null-ls")
    local has_eslintrc = function(utils)
      return utils.root_has_file({
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.mjs",
        ".eslintrc.cjs",
      })
    end
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        require("none-ls.code_actions.eslint_d").with({
          condition = function(utils)
            return has_eslintrc(utils)
          end,
        }),
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return has_eslintrc(utils)
          end,
        }),
        require("none-ls.formatting.eslint_d").with({
          condition = function(utils)
            return has_eslintrc(utils)
          end,
          runtime_condition = function(params)
            return params.root:match("~/code/work") ~= nil
          end,
        }),
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
      },
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  -- only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    }
  end,
}

return {
  {
    "neovim/nvim-lspconfig",
    -- other settings removed for brevity
    opts = {
      ---@type lspconfig.options
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
            root_dir = require("lspconfig.util").root_pattern(
              ".eslintrc*",
              ".eslintrc.js",
              ".eslintrc.json",
              ".eslintrc.yaml",
              ".eslintrc.yml"
            ),
          },
        },
        solidity = {
          cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
          filetypes = { "solidity" },
          -- require("lspconfig.util").root_pattern "foundry.toml",
          root_dir = require("lspconfig.util").find_git_ancestor,
          single_file_support = true,
          includePath = "",
        },
        unocss = {
          handlers = {
            ["textDocument/documentHighlight"] = function() end,
          },
        },
        move_analyzer = {
          -- cmd = { os.getenv("HOME") .. "/.cargo/bin/move-analyzer" },
          filetypes = { "move" },
          root_dir = require("lspconfig.util").root_pattern("Move.toml", ".git"),
        },
      },
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              if not require("lazyvim.util").format.enabled() then
                -- exit early if autoformat is not enabled
                return
              end

              local client = vim.lsp.get_clients({ bufnr = event.buf, name = "eslint" })
              -- if client then
              --   local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
              --   if #diag > 0 then
              --     vim.cmd("EslintFixAll")
              --   end
              -- end
            end,
          })
        end,
      },
    },
  },
}

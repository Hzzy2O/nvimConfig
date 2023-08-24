return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local mappings = opts.window.mappings
    mappings["<tab>"] = function(state)
      local node = state.tree:get_node()
      if require("neo-tree.utils").is_expandable(node) then
        state.commands["toggle_node"](state)
      else
        state.commands["open"](state)
        vim.cmd("Neotree reveal")
      end
    end
    mappings["h"] = function(state)
      local node = state.tree:get_node()
      if node.type == "directory" and node:is_expanded() then
        require("neo-tree.sources.filesystem").toggle_directory(state, node)
      else
        require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
      end
    end
    mappings["l"] = function(state)
      local node = state.tree:get_node()
      if node.type == "directory" then
        if not node:is_expanded() then
          require("neo-tree.sources.filesystem").toggle_directory(state, node)
        elseif node:has_children() then
          require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
        end
      else
        state.commands["open"](state)
      end
    end
    mappings["o"] = "system_open"
    mappings["s"] = ""
    mappings["S"] = ""

    opts.filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        window = {
          mappings = {
            ["o"] = "system_open",
          },
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local notify = require("notify")
          local cmd = "cmd"
          local args = { "/c", "start", '""' }
          if require("utils").is_mac then
            cmd = "open"
          end
          local process = {
            cmd = cmd,
            args = args,
            errors = "\n",
            stderr = vim.loop.new_pipe(false),
          }
          table.insert(process.args, path)
          process.handle, process.pid = vim.loop.spawn(
            process.cmd,
            { args = process.args, stdio = { nil, nil, process.stderr }, detached = true },
            function(code)
              process.stderr:read_stop()
              process.stderr:close()
              process.handle:close()
              if code ~= 0 then
                notify(string.format("system_open failed with return code %d: %s", code, process.error), "error")
              end
            end
          )
          table.remove(process.args)
          if not process.handle then
            notify(string.format("system_open failed to spawn command '%s': %s", process.cmd, process.pid), "error")
            return
          end
          vim.loop.read_start(process.stderr, function(err, data)
            if err then
              return
            end
            if data then
              process.errors = process.errors .. data
            end
          end)
          vim.loop.unref(process.handle)
        end,
      },
    }
  end,
}

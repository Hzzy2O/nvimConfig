local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- better up/down
map({ "n", "x" }, "<c-j>", "5j")
map({ "n", "x" }, "<c-k>", "5k")

-- Increment/decrement
map({ "n", "x" }, "+", "<c-a>")
map({ "n", "x" }, "-", "<c-x>")

-- select all
map({ "n", "x" }, "<c-a>", "gg<S-v>G")

map({ "n", "x" }, "<c-t>", "<Plug>(VM-Transpose)")
map({ "n", "x" }, "<M-t>", "<Plug>(VM-Add-Cursor-At-Pos)")

map({ "n", "x" }, "<leader>gv", "<cmd>DiffviewFileHistory<cr>")
map({ "n", "x" }, "<leader>gV", "<cmd>lua diffview_file_history_with_current_file()<cr>")
map({ "n", "x" }, "<leader>gd", "<cmd>DiffviewClose<cr>")
map({ "n", "x" }, "<Leader>nf", ":lua require('neogen').generate()<CR>")

map({ "n", "x" }, "<Leader>rn", ":IncRename ")
map({ "n", "x" }, "<Leader>uM", ":lua require('smear_cursor').toggle()<CR>")

vim.cmd("tnoremap <C-x> <C-\\><C-n>")
vim.cmd("noremap <C-b> <C-v>")

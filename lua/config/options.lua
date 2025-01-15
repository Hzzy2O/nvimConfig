-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.env.GIT_EDITOR = "nvr -cc tabedit"
vim.opt.laststatus = 3
vim.g.lazyvim_prettier_needs_config = true
vim.g.autoformat = false
vim.g.lazyvim_picker = "fzf"

local is_windows = vim.loop.os_uname().version:match("Windows")

if is_windows then
  -- vim.o.shell = "pwsh.exe -NoLogo"
  -- vim.opt.shell = "pwsh.exe -NoLogo"
  -- vim.opt.shellcmdflag =
  --   "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  -- vim.cmd([[
  --   let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  --   let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  --   set shellquote= shellxquote=
  -- ]])

  vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h10" }
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
else
  vim.g.neovide_input_macos_alt_is_meta = 1
  vim.opt.guifont = { "JetBrainsMono Nerd Font", "h10" }
end

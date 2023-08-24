local M = {}

local version = vim.loop.os_uname().version
M.is_windows = version:match("Windows")
M.is_mac = version:match("Darwin")

return M

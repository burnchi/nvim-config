-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    -- merge options,conflict use value from rightmost map
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- ---------- 插入模式 --------------
Map("i", "jk", "<ESC>")

-- ---------- 视觉模式 --------------
Map("v", "<s-h>", "^")
Map("v", "<s-l>", "$")

-- ---------- 正常模式 --------------
-- 窗口
-- 新增水平窗口
Map("n", "<leader>ss", "<C-w>v", { desc = "verticle split window" })
-- 新增垂直窗口
Map("n", "<leader>sv", "<C-w>s", { desc = "horizon split window" })
-- select all
Map("n", "<C-a>", "GVgg")
-- quick move cursor
Map("n", "H", "^")
Map("n", "L", "$")
Map("n", "dH", "d^")
Map("n", "dL", "d$")
-- no highlight
Map("n", "<leader>nh", ":nohl<CR>", { desc = "cancel highlight" })
-- close window
Map("n", "<leader>wd", "<C-w>c", { desc = "close window" })

-- ---------- 选择模式 --------------

-- ---------- 命令模式 --------------
-- stop search something or command line
Map("c", "jk", "<c-c>")

------------- 插件快捷键-------------
-- fittencode
Map("i", "<a-j>", function()
  require("fittencode").accept_all_suggestions()
end, { desc = "accept_all_suggestions" })

Map("i", "<a-k>", function()
  require("fittencode").dismiss_suggestions()
end, { desc = "dismiss_all_suggestions" })

Map("n", "<leader>fc", "<cmd>Fitten start_chat<cr>", { desc = "start_chat" })

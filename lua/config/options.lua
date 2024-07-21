-- lazyvim default options
-- https://www.lazyvim.org/configuration/general

-- 注释的地方有的是因为lazyvim帮我们配好了

local opt = vim.opt
vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
-- File-content encoding for the current buffer
opt.fileencoding = "utf-8"

-- 显示行号
-- opt.number = true
-- 数字列宽
opt.numberwidth = 1

-- 粘贴不会乱码
-- opt.clipboard = "unnamedplus"
-- opt.title = true

-- 换行自动缩进
opt.autoindent = true
-- opt.smartindent = true
-- Use spaces instead of tabs
-- opt.expandtab = true

opt.smarttab = true

-- Number of spaces to use for each step of (auto)indent
-- opt.shiftwidth = 2
-- opt.tabstop = 2

-- 高亮搜索结果
opt.hlsearch = true

-- 向下滑动时显示最小行数
-- opt.scrolloff = 10
--
-- opt.wildignore:append({ "*/node_modules/*" })

-- 鼠标右键后不会有提示
opt.mouse = ""
-- display debug column and set width
opt.signcolumn = "yes:1"
-- opt.signcolumn = "no"

-- 不按键延迟 gc 触发不了
opt.timeoutlen = 1000

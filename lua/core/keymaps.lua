-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = vim.keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- Normal 模式
-- map('mode', 'key', 'action', 'options')
-- 取消 s 默认功能
map.set("n", "s", "", opt)

-- TODO:分屏浏览存在问题
--  分屏
map.set("n", "<A-z>", ":vsp<CR>", opt)
map.set("n", "sh", ":sp<CR>", opt)

-- 关闭当前窗口
map.set("n", "sc", "<C-w>c", opt)
-- 关闭其他窗口
map.set("n", "so", "<C-w>o", opt)

-- 光标跳转
map.set("n", "<A-h>", "<C-w>h", opt)
map.set("n", "<A->j", "<C-w>j", opt)
map.set("n", "<A->k", "<C-w>k", opt)
map.set("n", "<A->l", "<C-w>l", opt)

-- 左右比例控制
map.set("n", "<C-Left>", ":vertical resize +10<CR>", opt)
map.set("n", "<C-Right>", ":vertical resize -10<CR>", opt)
-- 上下比例
map.set("n", "<C-Down>", ":resize -5<CR>", opt)
map.set("n", "<C-Up>", ":resize +5<CR>", opt)
-- 等比例
map.set("n", "se", "<C-w>=", opt)


-- Visual 模式
-- 缩进代码
map.set("v", "<", "<gv", opt)
map.set("v", ">", ">gv", opt)

-- nvim-tree
map.set("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

-- bufferline
-- 左右 tab 切换
map.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map.set("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭当前标签页
map.set("n", "<C-w>", ":Bdelete!<CR>", opt)

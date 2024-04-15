--  vim.g.{name}:全局变量
--  vim.b.{name}:缓冲区变量
--  vim.w.{name}:窗口变量
--  vim.bo.{option}:buffer-local选项
--  vim.wo.{option}:window-local选项

-- utf-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- jkhl 移动时周围保留 10 行
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

-- >> << 控制缩进
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- 行号
vim.wo.relativenumber = true
vim.wo.number = true

-- 缩进
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- 空格替代 tab
vim.o.expandtab = true
vim.bo.expandtab = true

-- 高亮当前行
vim.wo.cursorline = true

-- 新行对其当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 若不包含大小写，搜索大小写不敏感
vim.o.ignorecase = true
vim.o.smartcase = true

-- 搜索不要高亮
vim.o.hlsearch = false

-- 输入时搜索
vim.incsearch = false

-- 命令行高
vim.o.cmdheight = 1

-- 当文件被外部程序修改时，自动加载文件
vim.o.autoread = true
vim.bo.autoread = true

-- 禁止折行
vim.wo.wrap = false

-- 光标在行首尾可以移动到上下两行
vim.o.whichwrap = '<,>,[,]'

-- 鼠标支持
vim.o.mouse = "a"

-- 关闭 swap
vim.o.swapfile = false

-- 设置等待键盘快捷键连击时间
vim.o.timeoutlen = 400

-- split window 从右边和下边出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 不可见字符显示：这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"

-- 补全增强
vim.o.wildmenu = true

-- 显示 tabline
-- vim.o.showtabline = 1

-- 使用增强状态栏插件后不再需要 vim 的模式提醒
vim.o.showmode = false

-- 自动补全不自动选中
vim.g.completeopt = "menu, menuone, noselect, noinsert"

-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

-- Don't pass messages to |ins-completin menu|
-- 状态栏消息更简洁
-- vim.o.shortmess = vim.o.shortmess .. 'c'

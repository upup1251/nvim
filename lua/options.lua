--tab 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
--UTF-8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"
--jk移动时上下保留4行
vim.o.scrolloff = 4
vim.o.sidescrolloff = 4
--文件被修改的时候，自动加载
vim.o.autoread = true
vim.bo.autoread = true
--禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.wo.signcolumn = "yes"  --显示左侧图标指示列
vim.opt.clipboard = "unnamedplus" --use system clipboard
vim.opt.mouse = 'a' --allow the mouse work
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true --switch buffer without save
vim.opt.showcmd = true --show the cmd in the bottom used to used
vim.opt.showmode = false --it will make the mode hidden
vim.opt.cursorline = true -- aline under the cusor
--search
vim.opt.incsearch = true --search as the characters are entered
vim.opt.ignorecase = true  --ignore the difference between B and b
vim.opt.hlsearch = true --set the hight light when search
vim.o.smartcase = true
--the undo forever
vim.opt.undofile = true
vim.opt.undodir = '/home/upupup/.config/nvim/undodir'
vim.opt.undolevels=1000     --设置保存的撤销历史记录的最大步数
vim.opt.undoreload=1000     --在 Neovim 重启时重新加载撤销历史记录

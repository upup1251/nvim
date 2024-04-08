local keymap = vim.keymap
--设置leader键为space
vim.g.mapleader = " "
keymap.set('i', 'jk', "<Esc>")
--the buffer , windows and tabs
--next:
keymap.set('n', '<C-n>', ":bnext<cr>")
keymap.set('n', '<C-m>', ':tabnext<cr>')
--size:
keymap.set('n', '<Up>', ':resize +1<cr>')
keymap.set('n', '<Down>', ':resize -1<cr>')
keymap.set('n', '<Right>', ':vertical resize +1<cr>')
keymap.set('n', '<Left>', ':vertical resize -1<cr>')

--增加窗口
keymap.set('n', '<leader>sv', "<C_w>v")
keymap.set('n', '<leader>sh', "<C_w>s")

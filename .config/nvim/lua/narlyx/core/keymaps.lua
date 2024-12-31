 -- Leader key
vim.g.mapleader = " "

-- Copy and Paste
vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set({'n', 'v'}, '<C-v>', '"+p')
vim.keymap.set('i', '<C-v>', '<C-r>+')

-- Save and quit
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>')
vim.keymap.set('n', '<C-q>', '<cmd>q<cr>')
vim.keymap.set('n', '<C-S-q>', '<cmd>qa!<cr>')

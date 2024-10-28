-- Copy and Paste
vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set({'n', 'v'}, '<C-v>', '"+p')
vim.keymap.set('i', '<C-v>', '<C-r>+')

-- Save and quit
vim.keymap.set('n', '<A-s>', '<cmd>w<cr>')
vim.keymap.set('n', '<A-S>', '<cmd>wq<cr>')
vim.keymap.set('n', '<A-q>', '<cmd>q<cr>')
vim.keymap.set('n', '<A-Q>', '<cmd>qa!<cr>')

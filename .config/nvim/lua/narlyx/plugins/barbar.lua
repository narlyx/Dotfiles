return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = true

    require'barbar'.setup {
      no_name_title = "Untitled",
    }

    local map = vim.api.nvim_set_keymap
    local options = { noremap = true, silent = true }

    map('n', '<A-,>', '<cmd>BufferPrevious<cr>', options)
    map('n', '<A-.>', '<cmd>BufferNext<cr>', options)
    map('n', '<A-<>', '<cmd>BufferMovePrevious<cr>', options)
    map('n', '<A->>', '<cmd>BufferMoveNext<cr>', options)
    map('n', '<A-1>', '<cmd>BufferGoto 1<cr>', options)
    map('n', '<A-2>', '<cmd>BufferGoto 2<cr>', options)
    map('n', '<A-3>', '<cmd>BufferGoto 3<cr>', options)
    map('n', '<A-4>', '<cmd>BufferGoto 4<cr>', options)
    map('n', '<A-5>', '<cmd>BufferGoto 5<cr>', options)
    map('n', '<A-6>', '<cmd>BufferGoto 6<cr>', options)
    map('n', '<A-7>', '<cmd>BufferGoto 7<cr>', options)
    map('n', '<A-8>', '<cmd>BufferGoto 8<cr>', options)
    map('n', '<A-9>', '<cmd>BufferGoto 9<cr>', options)
    map('n', '<A-w>', '<cmd>BufferClose<cr>', options)
    map('n', '<A-W>', '<cmd>BufferClose!<cr>', options)

    map('n', '≤', '<cmd>BufferPrevious<cr>', options)
    map('n', '≥', '<cmd>BufferNext<cr>', options)
    map('n', '¯', '<cmd>BufferMovePrevious<cr>', options)
    map('n', '˘', '<cmd>BufferMoveNext<cr>', options)
    map('n', '¡', '<cmd>BufferGoto 1<cr>', options)
    map('n', '™', '<cmd>BufferGoto 2<cr>', options)
    map('n', '£', '<cmd>BufferGoto 3<cr>', options)
    map('n', '¢', '<cmd>BufferGoto 4<cr>', options)
    map('n', '∞', '<cmd>BufferGoto 5<cr>', options)
    map('n', '§', '<cmd>BufferGoto 6<cr>', options)
    map('n', '¶', '<cmd>BufferGoto 7<cr>', options)
    map('n', '•', '<cmd>BufferGoto 8<cr>', options)
    map('n', 'ª', '<cmd>BufferGoto 9<cr>', options)
    map('n', '∑', '<cmd>BufferClose<cr>', options)
    map('n', '„', '<cmd>BufferClose!<cr>', options)
  end,
}

return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set("n", "<space>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true hidden=true<cr>")
  end,
}

return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"jonarrien/telescope-cmdline.nvim",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set(
				"n",
				"<C-p>",
				"<cmd>Telescope file_browser path=%:p:h select_buffer=true hidden=true<cr>",
				{}
			)
			vim.keymap.set("n", "<C-S-p>", "<cmd>Telescope cmdline<cr>", {})
			vim.keymap.set("n", ":", "<cmd>Telescope cmdline<cr>", { noremap = true })

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("cmdline")
		end,
	},
}

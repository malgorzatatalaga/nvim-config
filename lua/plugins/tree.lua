return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
	    local nvimtree = require("nvim-tree")

	    -- recommended settings from nvim-tree documentation
	    vim.g.loaded_netrw = 1
	    vim.g.loaded_netrwPlugin = 1

	    -- set keymaps
	    local keymap = vim.keymap -- for conciseness

	    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
		  desc = "Toggle file explorer"
		})

		vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {
		  desc = "Toggle file explorer on current file"
		})

		vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {
		  desc = "Refresh file explorer"
		})
    end,
}

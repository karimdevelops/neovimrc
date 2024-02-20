return {
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			vim.cmd("colorscheme nightfox")
		end,
	},
	{
		"j-hui/fidget.nvim",
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
			vim.keymap.set("n", "<leader>uf", vim.cmd.UndotreeFocus)
		end,
	},
}

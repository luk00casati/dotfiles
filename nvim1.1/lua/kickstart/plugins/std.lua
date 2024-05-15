return {
	-- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- require("ibl").setup(),
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },
	-- ui alternative
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	opts = {},
	-- },
}

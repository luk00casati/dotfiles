return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					header = {
						[[                                                                       ]],
						[[                                                                     ]],
						[[       ████ ██████           █████      ██                     ]],
						[[      ███████████             █████                             ]],
						[[      █████████ ███████████████████ ███   ███████████   ]],
						[[     █████████  ███    █████████████ █████ ██████████████   ]],
						[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
						[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
						[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
						[[                                                                       ]],
					}, --your header
					center = {
						{
							desc = "help",
							key = "SPC s h",
							key_format = " %s", -- remove default surrounding `[]`
							action = "builtin.help_tags",
						},
						{

							desc = "keys",
							key = "SPC s k",
							key_format = " %s", -- remove default surrounding `[]`
							action = "builtin.keymaps",
						},
						{
							desc = "Find Files",
							key = "SPC s f",
							key_format = " %s", -- remove default surrounding `[]`
							action = "builtin.find_files",
						},
						{
							desc = "recent files",
							key = "SPC s .",
							key_format = " %s", -- remove default surrounding `[]`
							action = "builtin.oldfiles",
						},
						{
							desc = "quit",
							key = "q",
							key_format = " %s",
							action = "qa",
						},
					},
					-- footer = {}, --your footer
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}

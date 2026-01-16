return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false
				}
			},
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					default = "󰈙",
				},
				git_status = {
					symbols = {
						added     = "✚",
						modified  = "",
						deleted   = "✖",
						renamed   = "󰁕",
						untracked = "U", -- ⬅ cambia el ?
						ignored   = "◌",
						unstaged  = "󰄱",
						staged    = "",
						conflict  = "",
					},
				},
			},
		})
	end
}
-- "nvim-tree/nvim-tree.lua",
-- dependencies = { "nvim-tree/nvim-web-devicons" },
-- config = function()
-- 	require('nvim-tree').setup({
-- 		view = {
-- 			width = 30,
-- 			side = "left",
-- 		},
-- 		renderer = {
-- 			group_empty = true,
-- 		},
-- 		filters = {
-- 			dotfiles = false,
-- 		},
-- 	})
-- end

return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"kristijanhusak/vim-dadbod-completion",
	},
	opts = {
		keymap = {
			preset      = "default",
			["<CR>"]    = { "accept", "fallback" },
			["<Tab>"]   = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Esc>"]   = { "hide", "fallback" },
		},
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		sources = {
			default = {
				"lsp",
				"path",
				"buffer",
				"dadbod",
			},
			providers = {
				dadbod = {
					name = "vim-dadbod-completion",
					module = "vim_dadbod_completion.blink",
				},
			},
		},
	},
}

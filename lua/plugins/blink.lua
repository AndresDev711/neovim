return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
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
	},
}

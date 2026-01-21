return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
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
				"snippets",
				"path",
				"buffer",
				"dadbod",
			},
			per_filetype = {
				sql = { "dadbod", "buffer" },
				mysql = { "dadbod", "buffer" },
				plsql = { "dadbod", "buffer" },
			},
			providers = {
				dadbod = {
					name = "vim-dadbod-completion",
					module = "vim_dadbod_completion.blink",
				},
			},
		},
	},
	config = function(_, opts)
		require("blink.cmp").setup(opts)
		require("luasnip.loaders.from_vscode").lazy_load()
	end
}

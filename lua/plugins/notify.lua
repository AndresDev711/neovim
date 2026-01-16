---@diagnostic disable: missing-fields
return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local notify = require "notify"
		notify.setup { background_colour = "#000001"}
		vim.notify = notify.notify
	end,
}

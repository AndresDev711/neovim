---@diagnostic disable: undefined-global
vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.termguicolors = true
vim.o.scrolloff = 8
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.updatetime = 200

local function set_line_number_colors()
	vim.api.nvim_set_hl(0, "CursorLineNr", {
		fg = "#ffb86c",
		bold = true,
	})
	vim.api.nvim_set_hl(0, "LineNrAbove", {
		fg = "#bbbbbb",
	})
	vim.api.nvim_set_hl(0, "LineNrBelow", {
		fg = "#bbbbbb",
	})
	-- vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#ffffff" })
	-- vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#f2f2f2" })
	-- vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#3a3a3a" })
end
set_line_number_colors()
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_line_number_colors
})
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if client.server_capabilities.documentHighlightProvider then
        vim.lsp.buf.document_highlight()
        return
      end
    end
  end,
})
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
	callback = vim.lsp.buf.clear_references,
})

-- Esto funciona en modo Normal y modo Visual
vim.keymap.set({ "n", "v" }, "<leader>j", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<leader>k", "<C-u>zz")

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true })

vim.diagnostic.config({
	virtual_text = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN]  = "▲",
			[vim.diagnostic.severity.HINT]  = "⚑",
			[vim.diagnostic.severity.INFO]  = "",
		},
	},
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})

vim.api.nvim_set_hl(0, "Cursor", { bg = "#ffffff", fg = "NONE" })
vim.api.nvim_set_hl(0, "TermCursor", { bg = "#ffffff", fg = "NONE" })

-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Float Error" })

--para que sirve esto?
vim.api.nvim_set_keymap(
	'n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>',
	{ noremap = true, silent = true }
)

vim.keymap.set({ "n", "v" }, "<leader>l", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file (Prettier)" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		if vim.api.nvim_buf_get_name(0):match("kulala_res") then
			vim.opt_local.foldenable = false
		end
	end,
})

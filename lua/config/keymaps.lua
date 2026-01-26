-- NODE COMMANDS
-- vim.keymap.set("n", "<leader>no", ":NodeOn<CR>", { desc = "Run npm run dev" })
-- vim.keymap.set("n", "<leader>ns", ":NodeStop<CR>", { desc = "Node stop server" })
-- vim.keymap.set("n", "<leader>du", ":DockerUp<CR>", { desc = "Docker compose up" })
-- vim.keymap.set("n", "<leader>ds", ":DockerDown<CR>", { desc = "Docker compose down" })

--BUFFERS
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Buffer delete" })
-- vim.keymap.set("n", "<leader>bd", function()
-- 	require("bufdelete").bufdelete(0, true)
-- end, { desc = "Delete buffer safely" })

vim.keymap.set("n", "<leader>ba", function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			vim.cmd("bd " .. buf)
		end
	end
end, { desc = "Delete all buffers" })

-- SAVE FILES
vim.keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit file" })

-- documentHighlight
vim.keymap.set("n", "<leader>hh", function()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	for _, client in ipairs(clients) do
		if client.server_capabilities.documentHighlightProvider then
			vim.lsp.buf.document_highlight()
			return
		end
	end
	vim.notify("LSP no soporta documentHighlight", vim.log.levels.WARN)
end, { desc = "Highlight references (LSP)" })
vim.keymap.set("n", "<leader>hc", vim.lsp.buf.clear_references,
	{ desc = "Clear references" }
)

-- MOVE UP AND DOWN
vim.keymap.set({ "n", "v" }, "<leader>j", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<leader>k", "<C-u>zz")

-- NAVIGATION SPLITS
vim.keymap.set("n", "<leader>vs", ":vs<CR>", { desc = "Split Vertical" })
vim.keymap.set("n", "<leader>vh", ":split<CR>", { desc = "Split Horizontal" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Split left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Split down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Split up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Split right" })

-- OPEN AND CLOSE NEOTREE
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
-- vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true })

-- FORMAT DOCUMENT
vim.keymap.set({ "n", "v" }, "<leader>l", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file (Prettier)" })

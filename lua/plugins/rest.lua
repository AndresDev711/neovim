return {
  'mistweaverco/kulala.nvim',
  config = function()
    require('kulala').setup({
			formatters = {
    	json = { "jq", "." }, -- Requiere tener 'jq' instalado en tu sistema
    	html = { "tidy", "-i", "-q", "--show-errors", "0" },
  },
		})
    vim.keymap.set('n', '<leader>rr', "<cmd>lua require('kulala').run()<cr>", { desc = "Ejecutar petición HTTP" })
  end,
}
      -- your configuration comes here
      -- global_keymaps = false,
      -- global_keymaps_prefix = "<leader>rr",
      -- kulala_keymaps_prefix = "",

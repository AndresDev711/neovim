return {
  "numToStr/Comment.nvim",
  opts = {
    mappings = {
      basic = false, -- desactiva gcc / gc por defecto
      extra = false,
    },
  },
  config = function(_, opts)
    require("Comment").setup(opts)

    local api = require("Comment.api")

    -- Ctrl + /  → comentar/descomentar línea
    vim.keymap.set("n", "<C-/>", function()
      api.toggle.linewise.current()
    end, { noremap = true, silent = true })

    -- Ctrl + /  → comentar selección
    vim.keymap.set("v", "<C-/>", function()
      api.toggle.linewise(vim.fn.visualmode())
    end, { noremap = true, silent = true })
  end,
}

return {
  'stevearc/oil.nvim',
  opts = {},
  -- Opcional: dependencias para iconos
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      -- Configuraciones por defecto (puedes dejarlas vacías para empezar)
      columns = {
        "icon",
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      -- Deshabilitar si no quieres que Oil tome el control de netrw
      default_file_explorer = true,
    })

    -- Definir un atajo de teclado para abrir Oil rápidamente
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir Oil" })
  end
}

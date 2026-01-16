return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,      -- Muestra si el archivo fue modificado
            path = 1,                -- 0: Solo nombre, 1: Ruta relativa, 2: Ruta absoluta
            symbols = {
              modified = ' ●',      -- El icono que aparece al modificar
              readonly = ' [RO]', 
              unnamed = '[Sin nombre]',
            }
          }
        }
      },
      -- Aquí definimos los colores según el estado
      options = {
        theme = 'auto', -- O tu tema favorito (catppuccin, gruvbox, etc.)
      }
    })
  end
}

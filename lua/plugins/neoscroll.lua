return {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup({
      mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'},
      hide_cursor = true,          -- Esconde el cursor mientras dura la animación
      stop_eof = true,             -- Se detiene al final del archivo
      duration_multiplier = 0.5,   -- Ajusta la velocidad (más bajo es más rápido)
    })
  end
}

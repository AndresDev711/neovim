return {
  "sphamba/smear-cursor.nvim",
  opts = {
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,
		cursor_color = "#ffffff",
		stiffness = 0.8,
trailing_stiffness = 0.3,      -- Controla el desvanecimiento del rastro
    trailing_exponent = 2,         -- Suaviza la curva de desvanecimiento
  },
}

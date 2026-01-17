return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			theme = 'auto', -- tema favorito
			globalstatus = true,
		},
		sections = {
			lualine_c = {
				{
					'filename',
					path = 1,      -- 0:Solo nombre 1:Ruta relativa, 2:Ruta absoluta
					file_status = false, -- Muestra el archivo modificado
					fmt = function(name)
						return '📁 ' .. name
					end,
					color = { fg = '#6AEB38' },
				},
				-- STATUS (modificado / readonly)
				{
					function()
						if vim.bo.modified then
							return ' ●'
						end
						if vim.bo.readonly then
							return ' [RO]'
						end
						return ''
					end,
					color = function()
						if vim.bo.modified then
							return { fg = '#e0af68' } -- amarillo
						end
						if vim.bo.readonly then
							return { fg = '#f7768e' } -- rojo
						end
						return {}
					end,
				},
			}
		},
		inactive_winbar = {
			lualine_c = { "filename" }
		}
	},
}

-- config = function()
-- 	require('lualine').setup({
-- 		sections = {
-- 		},
-- 		-- Aquí definimos los colores según el estado
-- 		options = {
-- 		},
-- 	})
-- end
-- PATH (ruta relativa)
-- {
--   function()
--     local path = vim.fn.expand('%:~:.:h')
--     if path == '.' or path == '' then
--       return ''
--     end
--     return path .. '/'
--   end,
--   color = { fg = '#7aa2f7' }, -- azul
-- },
--
-- -- FILENAME
-- {
--   function()
--     return vim.fn.expand('%:t')
--   end,
--   color = { fg = '#c0caf5', gui = 'bold' },
-- },
-- 	{
-- 		symbols = {
-- 			modified = ' ●', -- Icono visible al modificar
-- 			readonly = ' [RO]',
-- 			unnamed = '[Sin nombre]',
-- 		}
-- }

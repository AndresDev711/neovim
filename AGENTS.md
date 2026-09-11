# AGENTS.md

Guia para agentes que trabajen en esta configuracion de Neovim.

## Resumen

Esta es una configuracion de Neovim escrita en Lua y organizada alrededor de
`lazy.nvim`.

El punto de entrada es `init.lua`, que carga en orden:

1. `lua/config/settings.lua`
2. `lua/config/commands.lua`
3. `lua/config/keymaps.lua`
4. `lua/config/lazy.lua`

`lua/config/lazy.lua` instala/bootstrapea `lazy.nvim` si falta y luego importa
todas las especificaciones desde `lua/plugins`.

## Estructura

```text
.
├── init.lua
├── lazy-lock.json
├── AGENTS.md
├── after/
│   └── plugin/
│       └── lsp.lua
├── lsp/
│   ├── css_lsp.lua
│   ├── html_lsp.lua
│   ├── kotlin_language_server.lua
│   ├── lua_ls.lua
│   └── ts_ls.lua
└── lua/
    ├── config/
    │   ├── commands.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   ├── settings.lua
    │   └── plugins/
    │       └── luasnip.lua
    └── plugins/
        ├── autopairs.lua
        ├── blink.lua
        ├── bufdelete.lua
        ├── cmp.lua
        ├── colorschema.lua
        ├── comments-todo.lua
        ├── comments.lua
        ├── conform.lua
        ├── cursor.lua
        ├── dadbod.lua
        ├── friendly-snippets.lua
        ├── fugitive.lua
        ├── gitsigns.lua
        ├── indent-blankline.lua
        ├── lsp.lua
        ├── lualine.lua
        ├── luasnip.lua
        ├── mason.lua
        ├── neoscroll.lua
        ├── notify.lua
        ├── nvim-tree.lua
        ├── oil.lua
        ├── rest.lua
        ├── telescope.lua
        ├── tree-sitter.lua
        └── windsurf.lua
```

## Responsabilidades Por Carpeta

- `init.lua`: carga secuencial de los modulos base.
- `lua/config/settings.lua`: opciones globales de Neovim, diagnosticos,
  cursor, highlights, configuracion de Dadbod y autocmds globales.
- `lua/config/commands.lua`: comandos personalizados. Actualmente la mayor
  parte esta comentada y sirve como borrador para Node/Docker.
- `lua/config/keymaps.lua`: atajos globales, buffers, splits, formato,
  navegacion, document highlight, Neo-tree y Codeium.
- `lua/config/lazy.lua`: bootstrap de `lazy.nvim`, `mapleader` y carga de specs.
- `lua/plugins/*.lua`: especificaciones de plugins para Lazy. Cada archivo debe
  retornar una tabla compatible con `lazy.nvim`.
- `lua/config/plugins/*.lua`: configuracion auxiliar reusable para plugins que
  usan `main = "config.plugins.<nombre>"`.
- `after/plugin/lsp.lua`: configuracion activa de clientes LSP, capabilities de
  `blink.cmp` y `vim.lsp.enable`.
- `lsp/*.lua`: definiciones de servidores LSP por archivo. Revisar si estan
  realmente conectadas antes de modificarlas, porque la activacion actual se
  hace desde `after/plugin/lsp.lua`.
- `lazy-lock.json`: lockfile generado por Lazy. No editar a mano salvo que se
  este resolviendo un lock intencionalmente.

## Plugins Principales

- UI/tema: `tokyonight.nvim`, `lualine.nvim`, `nvim-notify`,
  `smear-cursor.nvim`.
- Navegacion/archivos: `telescope.nvim`, `telescope-file-browser.nvim`,
  `neo-tree.nvim`, `oil.nvim`.
- Edicion: `nvim-autopairs`, `Comment.nvim`, `indent-blankline.nvim`,
  `todo-comments.nvim`, `bufdelete.nvim`.
- Lenguajes: `nvim-lspconfig`, `mason.nvim`, `neodev.nvim`,
  `nvim-treesitter`, `nvim-treesitter-textobjects`.
- Completion/snippets: `blink.cmp`, `LuaSnip`, `friendly-snippets`,
  `vim-dadbod-completion`.
- Formato: `conform.nvim` con Prettier/Prettierd para JS/TS/React, JSON, HTML y
  CSS.
- Git: `vim-fugitive`, `gitsigns.nvim`.
- Base de datos/API: `vim-dadbod`, `vim-dadbod-ui`, `kulala.nvim`.
- IA/autocomplete: `codeium.vim`.

## Convenciones Actuales

- Mantener specs de plugins en archivos separados dentro de `lua/plugins`.
- Usar `opts = { ... }` cuando la configuracion es declarativa.
- Usar `config = function() ... end` cuando se requieren keymaps, llamadas
  manuales a `setup` o integracion entre plugins.
- Usar tabs en varios archivos Lua existentes; conserva el estilo local del
  archivo que edites.
- Preferir comentarios cortos en espanol si el archivo ya usa ese idioma.
- Evitar mover configuracion activa a otra carpeta sin confirmar el flujo de
  carga de Lazy y `after/plugin`.

## Keymaps Relevantes

- `<leader>` es espacio.
- `<leader>bd`: borrar buffer actual.
- `<leader>ba`: borrar todos los buffers listados cargados.
- `<leader>ww`: guardar archivo.
- `<leader>wq`: guardar y salir.
- `<leader>hh`: resaltar referencias con LSP si el servidor lo soporta.
- `<leader>hc`: limpiar referencias LSP.
- `<leader>j` / `<leader>k`: bajar/subir media pagina y centrar.
- `<leader>vs` / `<leader>vh`: split vertical/horizontal.
- `<leader>wh`, `<leader>wj`, `<leader>wk`, `<leader>wl`: navegar splits.
- `<leader>e`: alternar Neo-tree.
- `<leader>l`: formatear con Conform.
- `<C-i>` en insert: aceptar sugerencia de Codeium.
- `-`: abrir Oil.
- `<leader>rr`: ejecutar request con Kulala.
- Telescope: `<leader>pp`, `<leader>pe`, `<leader>pf`, `<leader>ph`,
  `<leader>bb`, `<leader>gs`, `<leader>gc`, `<leader>gb`, `gd`.

## LSP

La configuracion activa esta en `after/plugin/lsp.lua`.

Actualmente se configuran capabilities desde `blink.cmp` para:

- `lua_ls`
- `vtsls`
- `html`
- `cssls`
- `kotlin_language_server`

Y se habilitan esos mismos servidores con `vim.lsp.enable`.

Notas importantes:

- `lua/plugins/lsp.lua` carga `nvim-lspconfig`, `mason.nvim` y `neodev.nvim`,
  pero no activa servidores directamente.
- Existen archivos en `lsp/` para `lua_ls`, `ts_ls`, `html_lsp` y `css_lsp`.
  Antes de asumir que estan en uso, validar la version de Neovim y como
  `vim.lsp.config` esta resolviendo configuraciones locales.
- `kotlin_language_server` usa el binario instalado por Mason y fuerza Temurin
  21 como `JAVA_HOME`, porque el servidor falla con Java 25.
- Hay una diferencia visible entre `ts_ls.lua` y el servidor activo `vtsls`.
  Tratar esto con cuidado si se corrige TypeScript LSP.

## Formato

`conform.nvim` se carga en `BufReadPre` y `BufNewFile`.

Formatters configurados:

- `javascript`, `typescript`, `javascriptreact`, `typescriptreact`:
  `prettierd`, luego `prettier`.
- `json`, `html`, `css`: `prettier`.

Tambien hay un keymap manual con `<leader>l`.

## Puntos De Cuidado

- `lua/plugins/cmp.lua` conserva una configuracion vieja de `nvim-cmp`
  comentada. La completion activa parece ser `blink.cmp`.
- `lua/config/commands.lua` contiene comandos Node/Docker comentados; no estan
  disponibles hasta descomentarlos.
- `nvim-tree.lua` en realidad configura `neo-tree.nvim`; el nombre del archivo
  puede confundir.
- `after/plugin/lsp.lua` tiene una funcion `map` preparada dentro de
  `LspAttach`, pero los keymaps LSP estan comentados.
- `settings.lua` agrega `/opt/homebrew/opt/mysql-client/bin` al `PATH` para
  Dadbod. Evitar reemplazarlo sin considerar conexiones MySQL.
- `kulala.nvim` depende externamente de `jq` y `tidy` para formatear respuestas.
- `telescope-fzf-native.nvim` usa `build = "make"`, asi que requiere toolchain
  disponible al instalar.
- Muchos iconos dependen de una Nerd Font.

## Como Agregar Un Plugin

1. Crear un archivo en `lua/plugins/<nombre>.lua`.
2. Retornar una spec de Lazy:

```lua
return {
  "autor/plugin.nvim",
  event = "VeryLazy",
  opts = {},
}
```

3. Si la configuracion crece, moverla a `lua/config/plugins/<nombre>.lua` y usar
   `main = "config.plugins.<nombre>"`, siguiendo el patron de LuaSnip.
4. Ejecutar Neovim y revisar `:Lazy` para instalar/sincronizar.

## Verificacion Recomendada

Para cambios pequenos:

```sh
nvim --headless "+Lazy! sync" +qa
nvim --headless "+checkhealth" +qa
```

Para cambios de Lua o LSP:

```sh
nvim --headless "+lua vim.print('config ok')" +qa
nvim --headless "+lua vim.lsp.get_clients()" +qa
```

Usar comandos mas especificos si el cambio afecta un plugin concreto.

## Instrucciones Para Agentes

- Preferir herramientas del grafo `codebase-memory-mcp` para descubrir codigo:
  `search_graph`, `trace_path`, `get_code_snippet`, `query_graph` y
  `search_code`.
- Usar `rg` solo para literales, archivos no indexados o cuando el grafo no sea
  suficiente.
- No editar `lazy-lock.json` manualmente excepto por una razon explicita.
- No eliminar configuracion comentada sin pedir confirmacion; varias secciones
  parecen notas personales o experimentos pausados.
- Mantener los cambios pequenos y localizados.
- Despues de cambios en plugins, revisar que Lazy pueda cargar la config.
- Despues de cambios en keymaps, verificar conflictos con mappings existentes.
- Despues de cambios en LSP, revisar `after/plugin/lsp.lua` y `lsp/` juntos.

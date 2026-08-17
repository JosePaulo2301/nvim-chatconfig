require("nvchad.configs.lspconfig").defaults()

local servers = { 
  "html",
  "cssls",
  "pyright"
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
-- Java (jdtls) is set up separately per-buffer in ftplugin/java.lua, not here

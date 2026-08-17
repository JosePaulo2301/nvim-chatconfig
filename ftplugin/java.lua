-- Java LSP setup (jdtls), loaded automatically for every *.java buffer.
-- Uses mason-installed jdtls + java-debug-adapter + java-test bundles.

local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  return
end

local mason_registry = require "mason-registry"
local mason_path = vim.fn.stdpath "data" .. "/mason/"

local jdtls_pkg = mason_registry.get_package "jdtls"
local jdtls_install_path = jdtls_pkg:is_installed() and jdtls_pkg:get_install_path() or (mason_path .. "packages/jdtls")

-- one workspace per project, keyed by project dir name
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/jdtls-workspace/" .. project_name

local os_config = "linux"
if vim.fn.has "mac" == 1 then
  os_config = "mac"
elseif vim.fn.has "win32" == 1 then
  os_config = "win"
end

-- optional debug/test bundles from mason (java-debug-adapter, java-test)
local bundles = {}

local debug_pkg_ok, debug_pkg = pcall(mason_registry.get_package, "java-debug-adapter")
if debug_pkg_ok and debug_pkg:is_installed() then
  local jar = vim.fn.glob(debug_pkg:get_install_path() .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
  if jar ~= "" then
    vim.list_extend(bundles, vim.split(jar, "\n"))
  end
end

local test_pkg_ok, test_pkg = pcall(mason_registry.get_package, "java-test")
if test_pkg_ok and test_pkg:is_installed() then
  local jars = vim.fn.glob(test_pkg:get_install_path() .. "/extension/server/*.jar", true)
  if jars ~= "" then
    vim.list_extend(bundles, vim.split(jars, "\n"))
  end
end

local nvlsp = require "nvchad.configs.lspconfig"
local capabilities = nvlsp.capabilities

local on_attach = function(_, bufnr)
  nvlsp.on_attach(_, bufnr)

  local map = vim.keymap.set
  local function opts(desc)
    return { buffer = bufnr, desc = "Java " .. desc }
  end

  map("n", "<leader>jo", jdtls.organize_imports, opts "organize imports")
  map("n", "<leader>jv", jdtls.extract_variable, opts "extract variable")
  map("n", "<leader>jc", jdtls.extract_constant, opts "extract constant")
  map("v", "<leader>jv", function()
    jdtls.extract_variable(true)
  end, opts "extract variable")
  map("v", "<leader>jm", function()
    jdtls.extract_method(true)
  end, opts "extract method")

  map("n", "<leader>jtc", jdtls.test_class, opts "test class")
  map("n", "<leader>jtm", jdtls.test_nearest_method, opts "test nearest method")
end

local config = {
  cmd = {
    jdtls_install_path .. "/bin/jdtls",
    "-configuration",
    vim.fn.stdpath "data" .. "/jdtls-config",
    "-data",
    workspace_dir,
  },

  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },

  capabilities = capabilities,
  on_attach = on_attach,

  settings = {
    java = {
      signatureHelp = { enabled = true },
      completion = { favoriteStaticMembers = {} },
      configuration = {
        runtimes = {
          { name = "JavaSE-11", path = "/usr/lib/jvm/java-11-openjdk-amd64" },
          { name = "JavaSE-25", path = "/usr/lib/jvm/java-25-openjdk-amd64", default = true },
        },
      },
    },
  },

  init_options = {
    bundles = bundles,
  },
}

jdtls.start_or_attach(config)

-- wire up java-debug / java-test once jdtls is fully ready
vim.api.nvim_create_autocmd("LspAttach", {
  buffer = 0,
  once = true,
  callback = function(args)
    if vim.lsp.get_client_by_id(args.data.client_id).name == "jdtls" then
      pcall(jdtls.setup_dap, { hotcodereplace = "auto" })
      pcall(require("jdtls.dap").setup_dap_main_class_configs)
    end
  end,
})

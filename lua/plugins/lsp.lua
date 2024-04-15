-- Neuer Code
local python_root_files = {
  "pyproject.toml",
  "setup.py",
  ".project",
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  "pyrightconfig.json",
  ".git",
}
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")
local capabilities = cmp_nvim_lsp.default_capabilities()
local root_dir_pattern = lspconfig.util.root_pattern(python_root_files)

return {
  "neovim/nvim-lspconfig",

  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "gd", false }
    keys[#keys + 1] = { "gt", false } -- go to definition
    keys[#keys + 1] = { "gd", false } -- peak definition
    keys[#keys + 1] = { "gD", false } -- go to definition
    keys[#keys + 1] = { "ca", false } -- see available code actions
    keys[#keys + 1] = { "rn", false } -- smart rename
    keys[#keys + 1] = { "D", false } -- show  diagnostics for line
    keys[#keys + 1] = { "d", false } -- show diagnostics for cursor
    keys[#keys + 1] = { "pd", false } -- jump to prev diagnostic in buffer
    keys[#keys + 1] = { "nd", false }
    keys[#keys + 1] = { "K", false }
    --
  end,

  opts = {
    servers = {
      pyright = {
        autoformat = false,
        disableOrganizeImports = true,
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          autoImportCompletions = true,
          nreportOptionalSubscript = false,
        },
      },
      setup = {
        pyright = {
          root_dir = root_dir_pattern,
          capabilities = capabilities,
          print(root_dir_pattern),
        },
      },
    },
  },
}

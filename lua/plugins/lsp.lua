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
local config = function()
  require("neoconf").setup({})
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local lspconfig = require("lspconfig")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- lua
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = { -- custom settings for lua
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  })

  -- json
  lspconfig.jsonls.setup({
    capabilities = capabilities,
    filetypes = { "json", "jsonc" },
  })

  -- python
  lspconfig.pyright.setup({
    capabilities = capabilities,
    settings = {
      pyright = {
        autoformat = true,
        disableOrganizeImports = true,
        analysis = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          autoImportCompletions = true,
          reportOptionalSubscript = false,
        },
      },
    },
    root_dir = lspconfig.util.root_pattern(python_root_files),
  })

  -- bash
  lspconfig.bashls.setup({
    capabilities = capabilities,
    filetypes = { "sh", "aliasrc" },
  })

  -- solidity
  lspconfig.solidity.setup({
    capabilities = capabilities,
    filetypes = { "solidity" },
  })

  -- docker
  lspconfig.dockerls.setup({
    capabilities = capabilities,
  })

  -- C/C++
  lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  })

  print("config")
end

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
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}

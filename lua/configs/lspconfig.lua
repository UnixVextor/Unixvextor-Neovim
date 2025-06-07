-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "clangd",
  "pyright",
  "ts_ls",
  "tailwindcss",
  "emmet_ls",
  "prismals",
  "docker_compose_language_service",
  "dockerls",
}

local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig/util"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.docker_compose_language_service.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  cmd = { "docker-compose-langserver", "--stdio" },
  filetypes = {
    "yaml.docker-compose",
    "yml.docker-compose",
  },
  root_dir = util.root_pattern(
    "docker-compose.yaml",
    "docker-compose.yml",
    "docker-compose.dev.yaml",
    "docker-compose.dev.yml",
    "docker-compose.prod.yaml",
    "docker-compose.prod.yml",
    "compose.yaml",
    "compose.yml"
  ),
  single_file_support = true,
}

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "vue" },
      },
    },
  },
}

lspconfig.volar.setup {}

lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
}

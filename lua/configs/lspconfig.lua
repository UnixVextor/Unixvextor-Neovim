-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- LSP Servers
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
  "terraformls",
  "tflint",
}

vim.lsp.enable(servers)

local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig/util"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

vim.lsp.config("docker_compose_language_service", {
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
})

vim.lsp.config("ts_ls", {
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
})

vim.lsp.config("gopls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
})

vim.lsp.config("terraformls", {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  filetypes = { "terraform" },
  root_dir = function(fname)
    return vim.lsp.util.root_pattern(".terraform", ".git", "main.tf")(fname) or vim.fn.getcwd()
  end,
})

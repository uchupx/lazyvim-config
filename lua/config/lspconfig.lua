local servers = { "intelephense", "gopls", "tsserver", "docker_compose_language_service", "twiggy-language-server",
  "tailwindcss-language-server", "css-lsp" }

for _, value in pairs(servers) do
  require("lspconfig")[value].setup({
    on_attach = require("completion").on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  })
end

local servers = { "intelephense", "gopls", "tsserver", "docker_compose_language_service", "twiggy-language-server",
  "tailwindcss-language-server", "css-lsp", "actionlint", "nginx-language-server", "pyright", "bacon-ls" }

for _, value in pairs(servers) do
  local config = {
    on_attach = require("completion").on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  } 

  if (value == "twiggy-language-server")
  then
    config.filetypes = { "twig", "volt", "phtml" }
  end
  require("lspconfig")[value].setup(config)
end

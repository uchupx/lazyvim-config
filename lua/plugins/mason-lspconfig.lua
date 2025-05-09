return {
  {
    {"williamboman/mason.nvim", version = "^1.0.0"},
    {"williamboman/mason-lspconfig.nvim", version = "^1.0.0"},
    "neovim/nvim-lspconfig",
    opts = {
      on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end,
    },

  },
}

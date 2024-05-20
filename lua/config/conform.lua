-- require("conform").formatters_by_ft.go = { "goimports" }
require("lazy.core.config").plugins["conform.nvim"].opts = {
  formatters_by_ft = {
    go = { "goimports" },
  },
}

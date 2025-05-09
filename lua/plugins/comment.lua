return {
  {
    "numToStr/Comment.nvim",
    enabled = false,

    config = function()
      require("Comment").setup()
      vim.api.nvim_set_keymap('n', '<leader>/', "<Plug>(comment_toggle_linewise_current)",
        { noremap = true, silent = true })
    end,
    opts = {
      -- add any options here
    },
    lazy = false,
  },
}

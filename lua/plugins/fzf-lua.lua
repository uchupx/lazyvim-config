return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
    vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('fzf-lua').files()<CR>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fs', "<cmd>lua require('fzf-lua').live_grep()<CR>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('fzf-lua').help_tags()<CR>",
      { noremap = true, silent = true })
  end
}

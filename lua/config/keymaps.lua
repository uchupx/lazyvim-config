-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local D = {
  n = {
    "<leader>/",
    "<M-\\>",
    -- "<C-/>",
    "<leader>up",
    "<leader>us",
  },

  v = {
    "<leader>/",
  },

  i = {
    "<C-/>",
  },

  t = {
    "<M-\\>",
    "<C-/>",
  },
}

-- delete keymap
for mode, modeval in pairs(D) do
  for _, val in pairs(modeval) do
    pcall(function()
      vim.keymap.del(mode, val, { clear = true })
    end)
  end
end

-- local Util = require("lazyvim.util")
-- local lazyterm = function()
--   Util.terminal(nil, { cwd = Util.root() })
-- end
local M = {
  -- normal mode
  n = {
    ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle Comment" },
    ["<leader>h"] = { ":ToggleTerm direction=horizontal<cr>", "Open Terminal horizontal" },
    ["<leader>fs"] = {
      function()
        require("telescope.builtin").live_grep()
      end,
      "Find in files",
    },
    ["<leader>up"] = {
      function()
        local path = vim.fn.expand('%:.')
        os.execute("~/script/script/update_file.sh " .. path .. " .git/.env")
      end, "Upload batch by git status, FTP", },
    ["<M-esc>"] = { ":Neotree<cr>", "Open nvim tree" }
  },
  i = {
    ["<C-;>"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle Comment" },
    ["<C-q>"] = {
      function()
        require("cmp").abort()
      end,
      "Abort Completion",
    },
  },
  v = {
    ["<leader>/"] = { "<Plug>(comment_toggle_linewise_visual)", "Toggle Comment" },
  }
}
-- visual mode
--
for mode, modeval in pairs(M) do
  for key, val in pairs(modeval) do
    local keymap = key
    local keymap_func = val[1]
    local keymap_desc = val[2]
    print(val[1])
    pcall(function()
      vim.keymap.set(mode, keymap, val[1], { noremap = true, silent = true, desc = keymap_desc })
    end)
  end
end

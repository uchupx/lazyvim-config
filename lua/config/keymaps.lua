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
function run(cmd, raw)
  return s
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
    ["<leader>co"] = { ":CopilotChatOpen<cr>", "Open Copilot Chat" },
    ["<leader>tq"] = { ":bd<cr>", "Close current buffer" },
    ["<leader>fs"] = {
      function()
        require("telescope.builtin").live_grep()
      end,
      "Find in files",
    },
    ["<leader>us"] = {
      function()
        local path = vim.fn.expand('%:.')
        --local exit = os.execute("~/script/script/single_upload.sh " .. path .. " .git/.env")
        -- local value = exit / 256
        local f = assert(io.popen("~/script/script/single_upload.sh " .. path .. " .git/.env", 'r'))
        local s = assert(f:read('*a'))
        f:close()
        s = string.gsub(s, '^%s+', '')
        s = string.gsub(s, '%s+$', '')
        s = string.gsub(s, '[\n\r]+', ' ')
        vim.notify(s, "info")
      end, "Upload current buffer to ftp, FTP", },
    ["<leader>ud"] = {
      function()
        local path = vim.fn.expand('%:.')
        --local exit = os.execute("~/script/script/single_upload.sh " .. path .. " .git/.env")
        -- local value = exit / 256
        local f = assert(io.popen("~/script/script/sync_file.sh " .. path .. " .git/.env", 'r'))
        local s = assert(f:read('*a'))
        f:close()
        s = string.gsub(s, '^%s+', '')
        s = string.gsub(s, '%s+$', '')
        s = string.gsub(s, '[\n\r]+', ' ')
        vim.notify(s, "info")
        vim.cmd("bdelete")
        vim.cmd("edit " .. path)
      end, "Sync current buffer from ftp, FTP", },
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

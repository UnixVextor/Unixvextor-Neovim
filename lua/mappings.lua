require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Neovim Tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<C-n>", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Menu UI and Shader colors
map("n", "<C-d>", "<cmd>Shades<CR>", { desc = "Color Shades" })
map("n", "<leader>p", "<cmd>Huefy<CR>", { desc = "Color pick" })

map({ "n" }, "<leader>m", function()
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options)
end, { desc = "Menu UI" })

map("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Menu UI" })

-- Lazygit Term
map("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "nvimtree focus window" })

-- Telescope ssh
map({ "n", "v" }, "<leader>fc", "<cmd>Telescope ssh-config<CR>", { desc = "Open an ssh extension" })

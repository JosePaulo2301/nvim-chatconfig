require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- switch windows from terminal mode (e.g. back to the editor)
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "terminal switch window left" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "terminal switch window down" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "terminal switch window up" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "terminal switch window right" })

-- workspace layout: code on top, 2 terminals side by side below
map("n", "<leader>ws", function()
  require("nvchad.term").new { pos = "sp" }
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal workspace split (code + 2 terminals)" })

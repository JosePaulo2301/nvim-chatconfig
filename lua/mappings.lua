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

-- debugging (nvim-dap), used for Java debugging via jdtls
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "debug toggle breakpoint" })

map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "debug continue / start" })

map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "debug step into" })

map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "debug step over" })

map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "debug step out" })

map("n", "<leader>dr", function()
  require("dap").repl.toggle()
end, { desc = "debug toggle repl" })

map("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "debug toggle dap-ui" })

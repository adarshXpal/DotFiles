return {
  "barrett-ruth/live-server.nvim",
  opts = {
    port = 8080, -- Default port (optional)
    browser = "firefox", -- Default browser (optional)
    quiet = false, -- Disable logs (optional)
  },
  keys = {
    -- Keybindings (optional)
    { "<leader>ls", "<cmd>LiveServerStart<CR>", desc = "Start Live Server" },
    { "<leader>lt", "<cmd>LiveServerStop<CR>", desc = "Stop Live Server" },
  },
}

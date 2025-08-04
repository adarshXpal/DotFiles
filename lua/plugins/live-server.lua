return {
  "barrett-ruth/live-server.nvim",
  opts = {
    cmd = "live-server",
    args = { "--open" },
  },
  keys = {
    { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Start Live Server" },
    { "<leader>lq", "<cmd>LiveServerStop<cr>", desc = "Stop Live Server" },
  },
}

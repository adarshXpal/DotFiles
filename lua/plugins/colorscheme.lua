return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup({
        -- Add any configuration options here if needed
      })
      vim.cmd("colorscheme mellifluous")
    end,
  },
  { "savq/melange-nvim" },
}

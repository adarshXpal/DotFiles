return {
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = { "smoka7/hydra.nvim" },
    opts = {
      hint_config = { border = "rounded" },
      on_exit = function()
        -- Clear multicursor
        vim.cmd([[MCclear!]])
        -- Force redraw to refresh UI
        vim.cmd([[redraw!]])

        -- FIX: Fully reload Mason UI if it was open
        if package.loaded["mason.ui"] then
          local mason_ui = require("mason.ui")
          if mason_ui.current_view then
            mason_ui.close() -- Close the broken UI
            vim.defer_fn(function()
              mason_ui.open() -- Reopen it cleanly
            end, 100)
          end
        end
      end,
    },
    keys = {
      { "<leader>mc", "<cmd>MCstart<cr>", desc = "Start multicursor" },
      { "<Esc>", "<cmd>MCclear<cr>", mode = { "n", "x" }, desc = "Exit multicursor" },
      { "<C-c>", "<cmd>MCclear<cr>", mode = { "n", "x" }, desc = "Force exit" },
      { "gn", "<cmd>MCunderCursor<cr>", mode = "n", desc = "Next occurrence" },
      { "gN", "<cmd>MCunderCursor<cr>", mode = "n", desc = "Prev occurrence" },
    },
    config = function(_, opts)
      require("multicursors").setup(opts)

      -- Manual fix command if needed
      vim.api.nvim_create_user_command("FixCursorMode", function()
        vim.cmd([[MCclear!]])
        vim.cmd([[redraw!]])
        if package.loaded["mason.ui"] then
          local mason_ui = require("mason.ui")
          if mason_ui.current_view then
            mason_ui.close()
            vim.defer_fn(function()
              mason_ui.open()
            end, 100)
          end
        end
      end, {})
    end,
  },
}

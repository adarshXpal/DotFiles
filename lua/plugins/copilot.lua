return {
  "github/copilot.vim",
  lazy = false,
  config = function()
    vim.g.copilot_no_tab_map = true  -- Disable default <Tab> mapping
    vim.g.copilot_assume_mapped = true

    -- Map 'i' + 'Tab' to accept Copilot suggestions
    vim.api.nvim_set_keymap(
      "i",
      "<Tab>",
      'copilot#Accept("<CR>")',
      { expr = true, silent = true, noremap = true }
    )

    -- Define a command to toggle Copilot
    vim.api.nvim_create_user_command('ToggleCopilot', function()
      if vim.g.copilot_enabled == nil or vim.g.copilot_enabled then
        vim.cmd("Copilot disable")
        vim.g.copilot_enabled = false
        print("Copilot disabled")
      else
        vim.cmd("Copilot enable")
        vim.g.copilot_enabled = true
        print("Copilot enabled")
      end
    end, {})

    -- Set the leader key to toggle Copilot using the command
    vim.api.nvim_set_keymap(
      "n",
      "<leader>cp",
      ":ToggleCopilot<CR>",
      { noremap = true, silent = true }
    )
  end,
}

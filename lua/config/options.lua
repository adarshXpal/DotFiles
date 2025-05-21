-- For cpp file execution !!
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F6>",
      ":w<CR>:!gnome-terminal -- bash -c 'g++ % -o %< && ./%<; read -p \"Press Enter to exit...\"'<CR>",
      { noremap = true, silent = true }
    )
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    -- Create the RunCpp command
    vim.api.nvim_buf_create_user_command(0, "RunCpp", function()
      -- Compile the C++ code without asking for flags
      local compile_command = "!g++ % -o %<"
      vim.cmd(compile_command)

      -- Ask for user input before running the compiled program
      vim.ui.input({ prompt = "Enter inputs for the program (leave blank if none): " }, function(input)
        local run_command = "./%<"
        if input and input ~= "" then
          run_command = "echo '" .. input .. "' | " .. run_command
        end
        vim.cmd("!" .. run_command)
      end)
    end, { nargs = 0 })

    -- Map <F5> to the RunCpp command
    vim.api.nvim_buf_set_keymap(0, "n", "<F5>", ":RunCpp<CR>", { noremap = true, silent = true })
  end,
})
-- For Kotlin file execution !!
-- Load LuaSnip configuration
vim.api.nvim_create_autocmd("FileType", {
  pattern = "kotlin",
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      "n",
      "<F6>",
      ":w<CR>:!gnome-terminal -- bash -c 'kotlinc % -include-runtime -d %<.jar && java -jar %<.jar; read -p \"Press Enter to exit...\"'<CR>",
      { noremap = true, silent = true }
    )
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "kotlin",
  callback = function()
    -- Create the RunKotlin command
    vim.api.nvim_buf_create_user_command(0, "RunKotlin", function()
      -- Compile the Kotlin code without asking for flags
      local compile_command = "!kotlinc % -include-runtime -d %<.jar"
      vim.cmd(compile_command)

      -- Ask for user input before running the compiled program
      vim.ui.input({ prompt = "Enter inputs for the program (leave blank if none): " }, function(input)
        local run_command = "java -jar %<.jar"
        if input and input ~= "" then
          run_command = "echo '" .. input .. "' | " .. run_command
        end
        vim.cmd("!" .. run_command)
      end)
    end, { nargs = 0 })

    -- Map <F5> to the RunKotlin command
    vim.api.nvim_buf_set_keymap(0, "n", "<F5>", ":RunKotlin<CR>", { noremap = true, silent = true })
  end,
})
vim.opt.termguicolors = true
-- Adding ctrl-a to select all
-- In your init.lua or a separate Lua file in your Neovim config
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })
--snippet loader
vim.opt.clipboard = "unnamedplus"

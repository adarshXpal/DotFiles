return {
  -- LuaSnip plugin
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load() -- Load VSCode-style snippets
  end,

  -- nvim-cmp for completion
  "hrsh7th/nvim-cmp",

  -- nvim-cmp snippet source
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",

  -- Friendly Snippets
  "rafamadriz/friendly-snippets",
}

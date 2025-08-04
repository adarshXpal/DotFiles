-- ~/.config/nvim/lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    local winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None"

    opts.window = {
      completion = cmp.config.window.bordered({
        winhighlight = winhighlight,
        col_offset = -3,
        side_padding = 0,
        scrollbar = false,
      }),
      documentation = cmp.config.window.bordered({
        winhighlight = winhighlight,
      }),
    }

    opts.formatting = {
      fields = { "abbr", "kind", "menu" },
      format = function(entry, vim_item)
        vim_item.menu = ({
          buffer = "[Buf]",
          nvim_lsp = "[LSP]",
          luasnip = "[Snip]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    }

    return opts
  end,
}

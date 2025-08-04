return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- Shrink completion window
    opts.window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        max_width = 50,
        max_height = 5,
        col_offset = -3,
        side_padding = 0,
      },
      documentation = false, -- disable docs window
    }

    -- Make items more compact
    opts.formatting = {
      fields = { "kind", "abbr" },
      format = function(_, item)
        item.abbr = string.sub(item.abbr, 1, 20)
        return item
      end,
    }

    return opts
  end,
}

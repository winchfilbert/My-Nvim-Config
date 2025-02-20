return {
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('nordic').setup({
          transparent = {
              bg = true,    -- Enable transparent background
              float = true, -- Enable transparent floating windows
          },
      on_highlight = function(highlights, palette)
        -- Make selection in visual mode lighter
        highlights.Visual = { bg = palette.light_gray or "#4C566A", fg = palette.white or "#D8DEE9" }

        -- Optional: Fix floating windows being too dark
        highlights.NormalFloat = { bg = "none" }
        highlights.FloatBorder = { bg = "none", fg = palette.border or palette.white }
        highlights.TelescopeNormal = { bg = "none" }
        highlights.TelescopeBorder = { bg = "none", fg = palette.border or palette.white }
    end,
    })
      require('nordic').load()
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      end
  }
}



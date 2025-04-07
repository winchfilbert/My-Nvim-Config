return {
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vesper").setup({
        transparent = true,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },
        overrides = {
        ["@keyword"] = { fg = "#708c83" },
        },
        palette_overrides = {
          green = "#7cafa1",
          muted = "7f9980"
        },
      })
      vim.cmd.colorscheme("vesper")
    end,
  },
}




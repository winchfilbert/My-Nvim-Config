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
          -- Obsidian UI highlights
          ObsidianTag = { italic = true, fg = "#FFCFAB" },
          ObsidianBullet = { bold = true, fg = "#FFCFAB" },
          ObsidianDone = { bold = true, fg = "#FFCFAB" },
          ObsidianBlockID = { italic = true, fg = "#FFCFAB" },

          -- RenderMarkdown heading & element highlights (prevent dark DiffText from making headings unseen)
          RenderMarkdownH1 = { bold = true, fg = "#FFCFAB" },
          RenderMarkdownH1Bg = { bold = true, fg = "#FFCFAB" },
          RenderMarkdownH2 = { bold = true, fg = "#7cafa1" },
          RenderMarkdownH2Bg = { bold = true, fg = "#7cafa1" },
          RenderMarkdownH3 = { bold = true, fg = "#FF8080" },
          RenderMarkdownH3Bg = { bold = true, fg = "#FF8080" },
          RenderMarkdownH4 = { bold = true, fg = "#FFC799" },
          RenderMarkdownH4Bg = { bold = true, fg = "#FFC799" },
          RenderMarkdownH5 = { bold = true, fg = "#99FFE4" },
          RenderMarkdownH5Bg = { bold = true, fg = "#99FFE4" },
          RenderMarkdownH6 = { bold = true, fg = "#65737E" },
          RenderMarkdownH6Bg = { bold = true, fg = "#65737E" },

          RenderMarkdownBullet = { link = "ObsidianBullet" },
          RenderMarkdownChecked = { link = "ObsidianDone" },
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

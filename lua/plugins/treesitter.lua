return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter.config", -- Modern singular 'config'
    opts = {
      ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "c" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}

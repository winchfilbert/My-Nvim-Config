return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    main = "nvim-treesitter.config",
    opts = {
      ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "c", "php", "html", "blade"},
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}

return {
  'Mofiqul/vscode.nvim',
  config = function()
    -- somewhere in your config:
    vim.o.background = "dark"
    vim.cmd("colorscheme vscode")
    vim.api.nvim_set_hl(0,"Normal", {bg = "none"})
    vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})
  end
}


-- Fix deprecated treesitter API for older plugins
if vim.treesitter then
  local get_lang = (vim.treesitter.language and vim.treesitter.language.get_lang)
    or vim.treesitter.get_lang

  if get_lang then
    -- Cover both old paths
    vim.treesitter.ft_to_lang = get_lang
    if vim.treesitter.language then
      vim.treesitter.language.ft_to_lang = get_lang
    else
      vim.treesitter.language = { ft_to_lang = get_lang, get_lang = get_lang }
    end
  end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("vim-options")
require("lazy").setup("plugins")
vim.wo.relativenumber = true
vim.opt.clipboard:append("unnamedplus")
-- using shift and shift + tab for normal mode
vim.keymap.set("n", "<Tab>", ">>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })
-- using shift and shift + tab for visual mode
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true })
vim.opt.autoindent = true
vim.opt.smartindent = true

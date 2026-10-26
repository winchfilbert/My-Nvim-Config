vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cmdheight=0")
vim.g.mapleader = " "

-- Stateful Vertical Terminal Toggle
local term_buf = nil
local term_win = nil

local function toggle_vsplit_term()
  -- 1. If the terminal window is currently open, hide it
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- 2. Create a right-side vertical split at 40% screen width
  vim.cmd("botright vsplit")
  vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.4))
  term_win = vim.api.nvim_get_current_win()

  -- 3. Reuse the existing terminal buffer if still alive, otherwise spawn a new one
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_win_set_buf(term_win, term_buf)
  else
    vim.cmd("terminal")
    term_buf = vim.api.nvim_get_current_buf()
    vim.bo[term_buf].buflisted = false -- Keep it out of your bufferline
  end

  -- 4. Automatically enter Terminal Insert mode
  vim.cmd("startinsert")
end

-- Toggle with Ctrl + \ (works in both Normal and Terminal mode)                                                                                  vim.keymap.set({ "n", "t" }, "<C-\\>", toggle_vsplit_term, { desc = "Toggle vertical terminal" })

-- Ergonomic exit from Terminal mode to Normal mode using double-Escape                                                                           vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Seamless window navigation out of the terminal using Ctrl + H/J/K/L                                                                            vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move to left split" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move to right split" })


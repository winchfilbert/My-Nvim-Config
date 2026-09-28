return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.85,
        row = 0.35,
        col = 0.50,
        preview = {
          layout = "horizontal", -- puts previewer side-by-side (on the right)
          horizontal = "right:55%", -- preview takes 55% width on the right
        },
      },
    })
      vim.keymap.set("n", "<C-p>", fzf.files, { desc = "Fzf Files" })
      vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Fzf Live Grep" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Fzf Buffers" })
    end,
  },
}

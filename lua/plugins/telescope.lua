return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-media-files.nvim',
    },
    config = function()
      -- Configure telescope
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown{}
          },
          media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "gif"},
            find_cmd = "rg"
          }
        }
      })
      
      -- Load extensions
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("media_files")
      
      -- Set keybindings
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fp', require('telescope').extensions.media_files.media_files, {})
    end
  }
}

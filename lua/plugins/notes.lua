return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    cmd = {
      "ObsidianToday",
      "ObsidianNew",
      "ObsidianQuickSwitch",
      "ObsidianSearch",
      "ObsidianBacklinks",
    },
    keys = {
      { "<leader>nd", "<cmd>ObsidianToday<cr>", desc = "Notes: Daily Scratchpad" },
      { "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "Notes: New Note" },
      { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Notes: Find Note" },
      { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Notes: Grep Vault" },
      { "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "Notes: Backlinks" },
      { "<leader>nc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Notes: Toggle Checkbox" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/notes",
        },
      },
      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
      },
      -- Obsidian UI configuration with custom highlight groups
      ui = {
        enable = false, -- render-markdown handles buffer rendering without concealing conflicts
        hl_groups = {
          ObsidianBullet = { bold = true, fg = "#FFCFAB" },
          ObsidianDone = { bold = true, fg = "#FFCFAB" },
          ObsidianTag = { italic = true, fg = "#FFCFAB" },
          ObsidianBlockID = { italic = true, fg = "#FFCFAB" },
        },
      },

      -- Clean, readable filenames instead of random Zettelkasten timestamps
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date("%Y%m%d")) .. "-" .. suffix
      end,

      -- Smart <CR> inside Markdown buffers: follows links or toggles checkboxes
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- Swap for "echasnovski/mini.icons" if you use mini
    },
    init = function()
      -- Highlight Obsidian tags (#tag) in markdown buffers using ObsidianTag
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.cmd([[syntax match ObsidianTag /\v(^|\s)@<=#[a-zA-Z0-9_\/-]+/]])
        end,
      })
    end,
    opts = {
      heading = {
        sign = false,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        backgrounds = {}, -- Clear DiffText/DiffAdd line background so headings are bright and visible
      },
      code = {
        sign = false,
        width = "block",
        right_pad = 2,
      },
      checkbox = {
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 ", highlight = "ObsidianDone" },
      },
      bullet = {
        highlight = "ObsidianBullet",
      },
    },
  },
}

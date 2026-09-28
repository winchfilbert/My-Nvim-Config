return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "cssls",
          "dockerls",
          "gopls",
          "html",
          "jsonls",
          "ts_ls",
          "eslint",
          "ast_grep",
          "pylsp",
          "tailwindcss",
          "emmet_ls",
          "intelephense",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Global LSP Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      -- Servers configured without extra options
      local default_servers = {
        "lua_ls",
        "clangd",
        "ts_ls",
        "gopls",
        "html",
        "cssls",
        "ast_grep",
        "pylsp",
        "tailwindcss",
        "dockerls",
        "jsonls",
        "eslint",
        "intelphense",
      }

      for _, server in ipairs(default_servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      -- Custom configuration for emmet_ls
      vim.lsp.config("emmet_ls", {
        capabilities = capabilities,
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "blade" },
      })
      vim.lsp.enable("emmet_ls")

      -- Make Tailwind CSS autompclete work in Blade Templates
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities, 
        filetypes = { "html", "css", "javascript", "typescript", "blade", "php" },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              blade = "html",
            },
          },
        },
      })
      vim.lsp.enable("tailwindcss")
    end,
  },
  {
    -- Replaced archived rust-tools.nvim with rustaceanvim
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          end,
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = { command = "clippy" },
            },
          },
        },
      }
    end,
  },
}

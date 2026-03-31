-- return {}

local lspconfig = require("lspconfig")
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Useful for debugging formatter issues
      format_notify = true,
      inlay_hints = { enabled = false },
      servers = {
        denols = {
          mason = false,
          enabled = false,
        },
        ruby_lsp = {
          mason = false,
          cmd = { "ruby-lsp" },
        },
        rubocop = {
          -- See: https://docs.rubocop.org/rubocop/usage/lsp.html
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
      },
    },
  },

  require("mason-lspconfig").setup({
    automatic_enable = false,
  }),
}

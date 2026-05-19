return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      format_notify = true,
      inlay_hints = { enabled = false },
      servers = {
        denols = {
          mason = false,
          enabled = false,
        },
        ruby_lsp = {
          mason = false,
        },
        rubocop = {
          mason = false,
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("Gemfile", ".git", ".")(fname)
          end,
        },
      },
      setup = {
        ruby_lsp = function(server, server_opts)
          vim.lsp.config(server, server_opts)
          vim.lsp.enable(server)
          return true
        end,
        rubocop = function(server, server_opts)
          vim.lsp.config(server, server_opts)
          vim.lsp.enable(server)
          return true
        end,
      },
    },
  },
}

-- Okay so I have a couple things going on here.
-- One is that I pull in the endwise treesitter plugin so that if you type a ruby expression that needs an end,
-- it'll automatically be inserted for you. Another is that I disable treesitter's indenting for the ruby language.
-- This is because, at least for me, letting treesitter take control of indenting feels terrible
-- with ruby (and same with yaml while I'm at it).

-- The other big thing is the list of the parsers to install.
-- Most of these are the default parsers that LazyVim comes with anyway, but I've added two important ones.
-- Obviously one of them is the ruby parser, but another is the embedded_template parser.
-- This parser will give you a much better experience writing ERB templates.

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    opts = function(_, opts)
      opts.endwise = { enable = true }
      opts.indent = { enable = true, disable = { "yaml", "ruby" } }
      opts.ensure_installed = {
        "bash",
        "embedded_template",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      }
    end,
  },
}

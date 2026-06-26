-- Apply my global markdownlint preferences to markdownlint-cli2.
--
-- The rules live in `.markdownlint.jsonc` at the root of this config dir.
-- markdownlint-cli2 only searches for config from the working directory
-- *downward* to each file, so when nvim's cwd is a project root it never sees
-- this file. Passing it explicitly via --config makes the preferences global.

return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint.jsonc" },
      },
    },
  },
}

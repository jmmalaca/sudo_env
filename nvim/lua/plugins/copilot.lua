vim.g.ai_enabled = false

local function toggle_ai()
  vim.g.ai_enabled = not vim.g.ai_enabled

  if package.loaded["minuet"] then
    require("minuet").config.blink.enable_auto_complete = vim.g.ai_enabled
  end

  local status = vim.g.ai_enabled and "enabled" or "disabled"
  vim.notify("AI tools " .. status, vim.log.levels.INFO)
end

vim.keymap.set("n", "<leader>ox", toggle_ai, { desc = "Toggle AI tools" })

return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function()
      require("minuet").setup({
        provider = "claude",
        provider_options = {
          claude = {
            model = "claude-sonnet-4-6",
            api_key = "ANTHROPIC_API_KEY",
          },
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- minuet removed from default sources so blink never loads it automatically.
        -- It is only activated when AI is toggled on via <leader>ox.
        default = { "lazydev", "path", "snippets" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}

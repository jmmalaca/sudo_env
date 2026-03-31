return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `toggle()`.
    { "folke/snacks.nvim", opts = { input = {}, picker = {} } },
  },
  config = function()
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on `opencode_opts`.
    }

    -- Required for `vim.g.opencode_opts.auto_reload`.
    vim.o.autoread = true

    local function ai_guard(fn)
      return function()
        if not vim.g.ai_enabled then
          vim.notify("AI tools are disabled. Enable with <leader>ox", vim.log.levels.WARN)
          return
        end
        fn()
      end
    end

    vim.keymap.set({ "n", "x" }, "<leader>oa", ai_guard(function()
      require("opencode").ask("@this: ", { submit = true })
    end), { desc = "Ask about this" })
    vim.keymap.set({ "n", "x" }, "<leader>os", ai_guard(function()
      require("opencode").select()
    end), { desc = "Select prompt" })
    vim.keymap.set({ "n", "x" }, "<leader>o+", ai_guard(function()
      require("opencode").prompt("@this")
    end), { desc = "Add this" })
    vim.keymap.set("n", "<leader>ot", ai_guard(function()
      require("opencode").toggle()
    end), { desc = "Toggle embedded" })
    vim.keymap.set("n", "<leader>oc", ai_guard(function()
      require("opencode").command()
    end), { desc = "Select command" })
    vim.keymap.set("n", "<leader>on", ai_guard(function()
      require("opencode").command("session_new")
    end), { desc = "New session" })
    vim.keymap.set("n", "<leader>oi", ai_guard(function()
      require("opencode").command("session_interrupt")
    end), { desc = "Interrupt session" })
    vim.keymap.set("n", "<leader>oA", ai_guard(function()
      require("opencode").command("agent_cycle")
    end), { desc = "Cycle selected agent" })
    vim.keymap.set("n", "<S-C-u>", ai_guard(function()
      require("opencode").command("messages_half_page_up")
    end), { desc = "Messages half page up" })
    vim.keymap.set("n", "<S-C-d>", ai_guard(function()
      require("opencode").command("messages_half_page_down")
    end), { desc = "Messages half page down" })
  end,
}

-- yazi.nvim — open yazi as a file browser inside Neovim
return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>y",  "<cmd>Yazi<cr>",        desc = "Open yazi at current file" },
    { "<leader>cw", "<cmd>Yazi cwd<cr>",    desc = "Open yazi at cwd" },
    { "<c-up>",     "<cmd>Yazi toggle<cr>", desc = "Resume last yazi session" },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}

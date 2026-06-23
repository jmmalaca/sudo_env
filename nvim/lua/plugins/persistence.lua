return {
  "folke/persistence.nvim",
  config = function(_, opts)
    require("persistence").setup(opts)

    -- The plugin re-saves the session on every quit by default, which
    -- overwrites a deliberate <leader>Fs save with whatever layout happens
    -- to be left if windows get closed one by one before quitting (e.g. the
    -- last single split standing). Saving/restoring is manual here, via
    -- <leader>Fs / <leader>FS, so disable the automatic save entirely.
    require("persistence").stop()
  end,
}

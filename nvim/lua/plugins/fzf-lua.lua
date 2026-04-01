return {
  "ibhagwan/fzf-lua",
  opts = {
    grep = {
      fzf_opts = {
        -- Persist live_grep queries across sessions; navigate with Up/Down arrows
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-grep-history",
        ["--history-size"] = "1000",
      },
    },
  },
}

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- add # frozen_string_literal: true to the first line of the current Ruby file
vim.keymap.set(
  "n",
  "<leader>rf",
  function()
    if vim.bo.filetype ~= "ruby" then
      vim.notify("Not a Ruby file", vim.log.levels.WARN)
      return
    end
    local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
    if first_line == "# frozen_string_literal: true" then
      vim.notify("Already frozen", vim.log.levels.INFO)
      return
    end
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { "# frozen_string_literal: true", "" })
  end,
  { noremap = true, silent = true, desc = "Ruby: add frozen_string_literal" }
)

-- resume last fzf-lua picker
vim.keymap.set(
  "n",
  "<leader>sx",
  function() require("fzf-lua").resume() end,
  { noremap = true, silent = true, desc = "Last Search" }
)

-- Favourites — a curated shortlist of the most-used commands.
-- Useful as a learning aid: press <leader>F to see the menu,
-- and gradually learn the original shortcuts shown in each description.
vim.schedule(function()
  -- Triggers an existing keymap so commands stay DRY
  local function map(lhs)
    return function()
      local keys = vim.api.nvim_replace_termcodes(lhs, true, false, true)
      vim.api.nvim_feedkeys(keys, "m", false)
    end
  end

  require("which-key").add({
    { "<leader>F",  group = "Favourites" },
    { "<leader>Fe", map("<leader>e"),         desc = "File tree          <leader>e" },
    { "<leader>Ff", map("<leader><leader>"),  desc = "Find files         <leader><leader>" },
    { "<leader>Fg", map("<leader>sg"),        desc = "Grep project       <leader>sg" },
    { "<leader>Fh", map("<leader>sg"),        desc = "Grep history       Ctrl+P / Ctrl+N in prompt" },
    { "<leader>FG", map("<leader>gg"),        desc = "LazyGit            <leader>gg" },
    { "<leader>Ft", map("<leader>ft"),        desc = "Terminal           <leader>ft" },
    { "<leader>Fu", map("<leader>uf"),        desc = "Toggle autoformat  <leader>uf" },
    { "<leader>Fl", map("<leader>l"),         desc = "Lazy               <leader>l" },
    { "<leader>F-", map("<leader>-"),         desc = "Split horizontal   <leader>-" },
    { "<leader>Fv", map("<leader>|"),         desc = "Split vertical     <leader>|" },
    { "<leader>Fw", map("<leader>wd"),        desc = "Delete window      <leader>wd" },
    { "<leader>Fb", map("<leader>bd"),        desc = "Delete buffer      <leader>bd" },
    { "<leader>FB", map("<leader>gb"),        desc = "Git blame          <leader>gb" },
    { "<leader>FM", "<Nop>",                  desc = "Multi cursor       <C-n> (repeat) → edit" },
    { "<leader>Fc", "<Nop>",                  desc = "Toggle comment      V → select → gc" },
    { "<leader>Fr", map("<leader>rf"),        desc = "Ruby frozen string  <leader>rf" },
  })
end)

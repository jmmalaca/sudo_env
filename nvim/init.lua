-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- turn this on for Transparency
function Transparent(color)
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
-- Transparent()

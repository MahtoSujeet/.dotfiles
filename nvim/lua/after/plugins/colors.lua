function ColorMyPencils(color)
  color = color or "github_dark_default"
  vim.cmd.colorscheme(color)

  -- To make bg transparent
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })        -- 0 means global
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })   -- 0 means global
end

ColorMyPencils()

function ColorMyPencils(color)
  color = color or "tokyonight"
  local transparent = false

  vim.cmd.colorscheme(color)

  -- To make bg transparent
  if (transparent) then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- 0 means global
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- 0 means global
  end
end

ColorMyPencils()

-- cursor color: #61AFEF
local colorscheme = "catppuccin"
-- local colorscheme = "everforest"
-- local colorscheme = "darkplus"
-- local colorscheme = "github_light"
-- require "user.conf.github-nvim-theme"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

if colorscheme == "onedark" then
  require "user.themes.onedark"
elseif colorscheme == "catppuccin" then
  require "user.themes.catppuccin"
end


vim.cmd [[
highlight LineNr guifg=gray
highlight CursorLineNr guifg=yellow
highlight Comment guifg=gray
highlight Visual guifg=#2f383e guibg=#a7c080
highlight Search guifg=#2f383e guibg=#a7c080
]]

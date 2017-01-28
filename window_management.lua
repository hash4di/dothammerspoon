local SCREEN_MODIFIER = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(SCREEN_MODIFIER, "Left", function()
  hs.window.focusedWindow():moveOneScreenWest()
end)

hs.hotkey.bind(SCREEN_MODIFIER, "Right", function()
  hs.window.focusedWindow():moveOneScreenEast()
end)

-- WIP to get rid of window_management_legacy.lua
local function resizeAndPlaceWindow(x, y, wDiv, hDiv)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if type(x) == 'integer' then
    f.x = max.x + x
  elseif type(x) == 'string' then -- 50%
    -- WIP
    -- f.x = max.x + (max.w * (tonumber(x) / 100))
  end
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- WIP to get rid of window_management_legacy.lua
-- For testing purposes
local WINDOW_MODIFIER = {"shift", "cmd", "ctrl"}
-- When finished we will use
--local WINDOW_MODIFIER = {"cmd", "ctrl"}
local function bindResizeAndPlaceWindow(hkey, x, y, wDiv, hDiv)
  hs.hotkey.bind(WINDOW_MODIFIER, hkey, function()
    resizeAndPlaceWindow(x, y, wDiv, hDiv)
  end)
end


bindResizeAndPlaceWindow("Left", 0, 0, 2, 1)
bindResizeAndPlaceWindow("Right", "50%", 0, 2, 1)
-- bindResizeAndPlaceWindow("Up", 0, 0, 1, 2)
-- bindResizeAndPlaceWindow("Down", 0, "+50%", 2, 1)

local SCREEN_MODIFIER = {"cmd", "alt", "ctrl"}
local WINDOW_MODIFIER = {"cmd", "ctrl"}

hs.hotkey.bind(SCREEN_MODIFIER, "Left", function()
  hs.window.focusedWindow():moveOneScreenWest()
end)

hs.hotkey.bind(SCREEN_MODIFIER, "Right", function()
  hs.window.focusedWindow():moveOneScreenEast()
end)

local function resizeAndPlaceWindow(x, y, wDiv, hDiv, wMul, hMul)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if type(x) == 'number' then
    f.x = max.x + x
  elseif type(x) == 'string' then -- 50%
    f.x = max.x + (max.w * (tonumber(x) / 100))
  end
  if type(y) == 'number' then
    f.y = max.y + y
  elseif type(y) == 'string' then -- 50%
    f.y = max.y + (max.h * (tonumber(y) / 100))
  end
  f.w = max.w / wDiv * wMul
  f.h = max.h / hDiv * hMul
  win:setFrame(f)
end

local function bindResizeAndPlaceWindow(hkey, x, y, wDiv, hDiv, wMul, hMul)
  hs.hotkey.bind(WINDOW_MODIFIER, hkey, function()
    resizeAndPlaceWindow(x, y, wDiv, hDiv, wMul, hMul)
  end)
end

bindResizeAndPlaceWindow("Return", 0, 0, 1, 1, 1, 1)

bindResizeAndPlaceWindow("Left", 0, 0, 2, 1, 1, 1)
bindResizeAndPlaceWindow("Right", "50", 0, 2, 1, 1, 1)
bindResizeAndPlaceWindow("Up", 0, 0, 1, 2, 1, 1)
bindResizeAndPlaceWindow("Down", 0, "50", 1, 2, 1, 1)

bindResizeAndPlaceWindow("[", 0, 0, 2, 2, 1, 1)
bindResizeAndPlaceWindow("]", "50", 0, 2, 2, 1, 1)
bindResizeAndPlaceWindow("'", 0, "50", 2, 2, 1, 1)
bindResizeAndPlaceWindow("\\", "50", "50", 2, 2, 1, 1)

bindResizeAndPlaceWindow(",", 0, 0, 3, 1, 1, 1)
bindResizeAndPlaceWindow(".", "33", 0, 3, 1, 1, 1)
bindResizeAndPlaceWindow("/", "66", 0, 3, 1, 1, 1)

bindResizeAndPlaceWindow("t", 0, 0, 4, 1, 3, 1)
bindResizeAndPlaceWindow("y", "25", 0, 4, 1, 3, 1)

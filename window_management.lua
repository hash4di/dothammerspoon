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

-- 4x4 keyboard matrix mapped to cells on the screen:
-- [ ]
-- ' \
bindResizeAndPlaceWindow("[", 0, 0, 2, 2, 1, 1)
bindResizeAndPlaceWindow("]", "50", 0, 2, 2, 1, 1)
bindResizeAndPlaceWindow("'", 0, "50", 2, 2, 1, 1)
bindResizeAndPlaceWindow("\\", "50", "50", 2, 2, 1, 1)

-- 3x1 keyboard matrix mapped to cells on the screen:
-- v b n
bindResizeAndPlaceWindow("v", 0, 0, 3, 1, 1, 1)
bindResizeAndPlaceWindow("b", "33", 0, 3, 1, 1, 1)
bindResizeAndPlaceWindow("n", "66", 0, 3, 1, 1, 1)

bindResizeAndPlaceWindow("t", 0, 0, 4, 1, 3, 1)
bindResizeAndPlaceWindow("y", "25", 0, 4, 1, 3, 1)

local function bindResizeAndPlaceWindowSmaller(hkey, x, y, wDiv, hDiv, wMul, hMul)
  hs.hotkey.bind(SCREEN_MODIFIER, hkey, function()
    resizeAndPlaceWindow(x, y, wDiv, hDiv, wMul, hMul)
  end)
end

-- 4x4 keyboard matrix mapped to cells on the screen in far corners - shift modified to quickly look window underneath:
-- [ ]
-- ' \
bindResizeAndPlaceWindowSmaller("[", 0, 0, 4, 4, 1, 1)
bindResizeAndPlaceWindowSmaller("]", "75", 0, 4, 4, 1, 1)
bindResizeAndPlaceWindowSmaller("'", 0, "75", 4, 4, 1, 1)
bindResizeAndPlaceWindowSmaller("\\", "75", "75", 4, 4, 1, 1)

-- 4x4 keyboard matrix mapped to cells on the screen (useful for 4K TVs):
-- 7 8 9 0
-- u i o p
-- j k l ;
-- m , . /
bindResizeAndPlaceWindow("7", 0, 0, 4, 4, 1, 1)
bindResizeAndPlaceWindow("8", "25", 0, 4, 4, 1, 1)
bindResizeAndPlaceWindow("9", "50", 0, 4, 4, 1, 1)
bindResizeAndPlaceWindow("0", "75", 0, 4, 4, 1, 1)

bindResizeAndPlaceWindow("u", 0, "25", 4, 4, 1, 1)
bindResizeAndPlaceWindow("i", "25", "25", 4, 4, 1, 1)
bindResizeAndPlaceWindow("o", "50", "25", 4, 4, 1, 1)
bindResizeAndPlaceWindow("p", "75", "25", 4, 4, 1, 1)

bindResizeAndPlaceWindow("j", 0, "50", 4, 4, 1, 1)
bindResizeAndPlaceWindow("k", "25", "50", 4, 4, 1, 1)
bindResizeAndPlaceWindow("l", "50", "50", 4, 4, 1, 1)
bindResizeAndPlaceWindow(";", "75", "50", 4, 4, 1, 1)

bindResizeAndPlaceWindow("m", 0, "75", 4, 4, 1, 1)
bindResizeAndPlaceWindow(",", "25", "75", 4, 4, 1, 1)
bindResizeAndPlaceWindow(".", "50", "75", 4, 4, 1, 1)
bindResizeAndPlaceWindow("/", "75", "75", 4, 4, 1, 1)

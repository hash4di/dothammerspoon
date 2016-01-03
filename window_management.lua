hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
  hs.window.focusedWindow():maximize()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
  hs.window.focusedWindow():moveOneScreenWest()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
  hs.window.focusedWindow():moveOneScreenEast()
end)

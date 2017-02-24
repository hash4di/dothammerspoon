hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, "v", function()
  text = hs.pasteboard.getContents()
  hs.eventtap.keyStrokes(text)
end)

-- Useful for rescheduling stuff in OmniFocus
hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, "t", function()
  hs.eventtap.keyStrokes('today')
  hs.eventtap.keyStroke({}, "ENTER")
end)

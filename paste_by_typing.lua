hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, "v", function()
  text = hs.pasteboard.getContents()
  hs.eventtap.keyStrokes(text)
end)

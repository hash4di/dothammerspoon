
require "app_hotkeys"
require "prev_application"
require "window_management"
require "paste_by_typing"
require "url_handler"

hs.window.animationDuration = 0

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()

-- Logitech K760 doesn't have Next key but has unused Eject key.
-- Use Karabiner "Eject to F13" to pass catchable hotkey.
hs.hotkey.bind({}, "f13", function ()
  hs.spotify.next()
end)

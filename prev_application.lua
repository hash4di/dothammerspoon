local prevApplication
local currentApplication

-- By default Herrmerspoon do not catch command+tag hotkey.
-- Use Karabiner "Command+tag to F5" to pass catchable hotkey.
hs.hotkey.bind({}, "f5", function ()
  print("hotkey: ")
  print(prevApplication)
  if prevApplication and hs.application.find(prevApplication) then
    hs.application.open(prevApplication)
  end
end)

function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.activated) then
    if (currentApplication ~= appObject:bundleID()) then
      prevApplication = currentApplication
      currentApplication = appObject:bundleID()
    end
    print("appObject:bundleID()")
    print(appObject:bundleID())
    print("currentApplication")
    print(currentApplication)
    print("prevApplication")
    print(prevApplication)
    print("---")
  end
end
local appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

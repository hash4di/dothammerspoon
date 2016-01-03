
local applicationHotkeys =
{
  {'c', 'iTerm'},
  {'d', 'Google Chrome Canary'},
  {'f', {'ForkLift', 'Finder'}},
  {'g', 'Firefox'},
  {'h', 'Dash'},
  {'i', {'VLC', 'Spotify'}},
  {'n', 'Numi'},
  {'o', 'Skype', 'focus'},
  {'r', 'ReadKit'},
  {'s', 'Mailbox (Beta)'},
  {'t', 'Trello'},
  {'u', 'Google Chrome'},
  {'v', 'Atom'},
  {'w', 'nvALT'},
  {'y', 'PivotalTracker'},
  {']', 'Slack', 'focus'},
  {'\\', '1Password 5'},
}

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "i", function()
--   if launchedNotFrontmost("VLC") then
--     hs.application.launchOrFocus("VLC")
--     return
--   end
--   hs.application.launchOrFocus("Spotify")
-- end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "i", function()
--   if launchedNotFrontmost("VLC") then
--     hs.application.launchOrFocus("VLC")
--     return
--   end
--   hs.application.launchOrFocus("Spotify")
-- end)

local function bindApplication(hotkey, appName, options)
  if type(appName) == 'table' then
    hs.hotkey.bind({"cmd", "alt", "ctrl"}, hotkey, function()
      for _, app in ipairs(appName) do
        if launchedNotFrontmost(app) then
          hs.application.launchOrFocus(app)
          return
        end
      end
    end)
  else
    hs.hotkey.bind({"cmd", "alt", "ctrl"}, hotkey, function()
      if options and options == 'focus' then
        focusLaunchedApp(appName)
      else
        hs.application.launchOrFocus(appName)
      end
    end)
  end
end

function launchedNotFrontmost(name)
  app = hs.application.find(name)
  if app and not app:isFrontmost() then
    return true
  else
    return false
  end
end

function focusLaunchedApp(name)
  app = hs.application.find(name)
  if app then
    app:activate()
  end
end

for _, applicationHotkey in ipairs(applicationHotkeys) do
  hotkey, application, options =
    applicationHotkey[1], applicationHotkey[2], applicationHotkey[3]
  bindApplication(hotkey, application, options)
end

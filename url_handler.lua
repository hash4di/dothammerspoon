require "url_handler/config"

local function tableElementMatches(table, value)
  for i=1,#table do
    if string.match(value, table[i]) then
      return true
    end
  end
  return false
end

-- Run known URLs in Chrome or Safari
-- Then allow to blacklist
-- Anything else runs in TorBrowser
hs.urlevent.httpCallback = function(scheme, host, params, fullURL)
  if tableElementMatches(CHROME_URL_REGEXPS, fullURL) then
    bundleID = 'com.google.Chrome'
  elseif tableElementMatches(SAFARI_URL_REGEXPS, fullURL) then
    bundleID = 'com.apple.Safari'
  elseif tableElementMatches(BLACKLIST_URL_REGEXPS, fullURL) then
    hs.alert.show("URL " .. fullURL .. " is blacklisted. If you want to use it remove matching regexp from BLACKLIST_URL_REGEXPS")
  else
    bundleID = 'org.mozilla.tor browser'
  end
  if bundleID then
    hs.urlevent.openURLWithBundle(fullURL, bundleID)
  end
end

-- Set hammerspoon as default browser to handle URLs
if hs.urlevent.getDefaultHandler("http") ~= "org.hammerspoon.hammerspoon" then
  hs.urlevent.setDefaultHandler("http")
end

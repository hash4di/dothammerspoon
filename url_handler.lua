require "url_handler/config"

local function tableElementMatches(table, value)
  for i=1,#table do
    if string.match(value, table[i]) then
      return true
    end
  end
  return false
end

local TRACKING_PARAMS = {
  'utm_medium',
  'utm_source',
  'utm_campaign',
  'utm_term'
}

local function isTrackingParam(paramName)
 for i=1,#TRACKING_PARAMS do
   if TRACKING_PARAMS[i] == paramName then
     return true
   end
 end
 return false
end

local function split(s, delimiter)
  result = {}
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match)
  end
  return result
end

-- Converts links like:
-- https://www.example.com/something?utm_medium=email&utm_source=newsletter&utm_campaign=example&utm_term=EN
-- To:
-- https://www.example.com/something?
local function stripTrackingFromUrl(fullURL)
  local baseUrl = split(fullURL, '?')[1]
  local params = split(fullURL, '?')[2]
  local paramsList = split(params, '&')

  local okParams = {}
  for i=1,#paramsList do
    paramName = split(paramsList[i], '=')[1]
    if not isTrackingParam(paramName) then
      table.insert(okParams, paramsList[i])
    end
  end

  local retVal = table.concat(
    {
      baseUrl,
      table.concat(
        okParams,
        '&'
      )
    },
    '?'
  )

  return retVal
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
    hs.urlevent.openURLWithBundle(stripTrackingFromUrl(fullURL), bundleID)
  end
end

-- Set hammerspoon as default browser to handle URLs
if hs.urlevent.getDefaultHandler("http") ~= "org.hammerspoon.hammerspoon" then
  hs.urlevent.setDefaultHandler("http")
end

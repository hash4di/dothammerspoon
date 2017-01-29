# dothammerspoon
My Hammerspoon config 

## url_handler configuration

Prepare repo with file `config.lua` containing something like:

```
CHROME_URL_REGEXPS = {
  'https://github.com/*',
  'https://gitlab.com/*'
}

SAFARI_URL_REGEXPS = {
  'http://staging.myproject.com/*'
}

BLACKLIST_URL_REGEXPS = {
  'http://somestupidsiteyoudonotwanttoseeanymore.com/*'
}
```

And add submodule called `url_handler` with it.

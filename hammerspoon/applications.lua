-------------------------
-- Application Management
-------------------------

-- https://github.com/philc/hammerspoon-config/
function launch_or_focus(appName)
  local app = hs.appfinder.appFromName(appName)
  if app == nil then
    hs.application.launchOrFocus(appName)
  else
    windows = app:allWindows()
    if windows[1] then
      windows[1]:focus()
    end
  end
end


apps = {
  ['space'] = 'iTerm',
  ['e'] = 'Emacs',
  ['f'] = 'Firefox',
  ['d'] = 'Google Chrome',
  ['s'] = 'Slack',
  ['a'] = 'Spotify',
  ['z'] = 'Pycharm',
  ['x'] = 'IntelliJ IDEA',
  ['c'] = 'Visual Studio Code'
}

for key, app in pairs(apps) do
  hs.hotkey.bind(mash, key, function() launch_or_focus(app) end)
end


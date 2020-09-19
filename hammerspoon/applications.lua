-------------------------
-- Application Management
-------------------------

    --if appName == 'Firefox' then app = hs.appfinder.appFromName(apps['f'])
    --  if app ~= nil then return launch_or_focus(apps['f']) end
-- https://github.com/philc/hammerspoon-config/
function launch_or_focus(appName)
  local app = hs.appfinder.appFromName(appName)
  if app == nil then
    if (appName == 'Firefox' and hs.appfinder.appFromName(apps['f']) ~= null) then
      return launch_or_focus(apps['f'])
    end
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
  ['e'] = 'Obsidian',
  ['d'] = 'Firefox',
  ['f'] = 'Google Chrome',
  ['s'] = 'Slack',
  ['a'] = 'Music',
  ['z'] = 'Pycharm',
  ['x'] = 'IntelliJ IDEA',
  ['c'] = 'Visual Studio Code'
}

for key, app in pairs(apps) do
  hs.hotkey.bind(mash, key, function() launch_or_focus(app) end)
end


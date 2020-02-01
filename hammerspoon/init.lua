
-- Notification examples
-- hs.notify.new({title="Title Text", informativeText="Information text"}):send()
--  hs.alert.show("Config Reloaded")



local mash = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(mash, "`", function()
  hs.reload()
end)

hs.window.animationDuration = 0

-- Taken from: https://github.com/philc/hammerspoon-config/blob/master/init.lua#L87
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

--------------------
-- Open Applications
--------------------
hs.hotkey.bind(mash, "t", function() launch_or_focus("iTerm") end)
hs.hotkey.bind(mash, "e", function() launch_or_focus("Emacs") end)
hs.hotkey.bind(mash, "f", function() launch_or_focus("Firefox") end)
hs.hotkey.bind(mash, "c", function() launch_or_focus("Google Chrome") end)
hs.hotkey.bind(mash, "s", function() launch_or_focus("Slack") end)
hs.hotkey.bind(mash, "1", function() launch_or_focus("Pycharm") end)
hs.hotkey.bind(mash, "2", function() launch_or_focus("Intellij") end)
hs.hotkey.bind(mash, "3", function() launch_or_focus("Visual Studio Code") end)


--------------------
-- Window Management
--------------------
function in_range(width, size)
  return width > size - 10 and width < size + 10
end

hs.hotkey.bind(mash, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local one_third = max.w * (1/3)
  local half = max.w* .5
  local two_third = max.w * (2/3)

  if in_range(f.w, one_third) then
    f.w = two_third
  elseif in_range(f.w, half) then
    f.w = one_third
  else
    f.w = half
  end

  f.x = max.x
  f.y = max.y
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(mash, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local one_third = max.w * (1/3)
  local half = max.w * .5
  local two_third = max.w * (2/3)

  if in_range(f.w, half) then
    f.w = one_third
    f.x = max.x + (max.w * (2/3))
  elseif in_range(f.w, one_third) then
    f.w = two_third
    f.x = max.x + (max.w * (1/3))
  else
    f.w = half
    f.x = max.x + (max.w * .5)
  end

  f.y = max.y
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(mash, "Up", function ()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(mash, "Down", function ()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  local two_third = max.w * .75
  local one_third = max.w * .5

  f.x = max.x + (max.w * .25)
  f.y = max.y
  f.w = one_third
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(mash, "=", function ()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  local x_diff = f.x - max.x
  local y_diff = f.y - max.y

  -- TODO: cleanup hacky calculations
  if y_diff > 10 then
    f.h = f.h + 10
    f.y = f.y - 10
  end

  if x_diff > 10 then
    f.x = f.x - 10
    f.w = f.w + 10
  end

  win:setFrame(f)

end)

hs.hotkey.bind(mash, "-", function ()
  -- TODO: shrink
end)


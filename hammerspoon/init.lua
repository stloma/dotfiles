
-- TODO: Menubar Config
-- local menu_bar = hs.menubar.new()
-- menu_bar.setTitle("hello")
-- menu_bar.setTitle("bye")

----------------------------
-- Hammerspoon Configuration
----------------------------

local mash = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(mash, "`", function()
  hs.reload()
end)

hs.alert.show("Hammerspoon loaded")

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

hs.hotkey.bind(mash, "space", function() launch_or_focus("iTerm") end)
hs.hotkey.bind(mash, "e", function() launch_or_focus("Emacs") end)
hs.hotkey.bind(mash, "f", function() launch_or_focus("Firefox") end)
hs.hotkey.bind(mash, "d", function() launch_or_focus("Google Chrome") end)
hs.hotkey.bind(mash, "s", function() launch_or_focus("Slack") end)
hs.hotkey.bind(mash, "a", function() launch_or_focus("Spotify") end)
hs.hotkey.bind(mash, "z", function() launch_or_focus("Pycharm") end)
hs.hotkey.bind(mash, "x", function() launch_or_focus("IntelliJ IDEA") end)
hs.hotkey.bind(mash, "c", function() launch_or_focus("Visual Studio Code") end)

--------------------
-- Window Management
--------------------

hs.grid.setGrid('12x12')
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.window.animationDuration = 0
local lastSeenChain = nil
local lastSeenWindow = nil
local screenCount = #hs.screen.allScreens()

local grid = {
  rightHalf = '6,0 6x12',
  rightThird = '8,0 4x12',
  rightTwoThirds = '4,0 8x12',

  leftHalf = '0,0 6x12',
  leftThird = '0,0 4x12',
  leftTwoThirds = '0,0 8x12',

  fullScreen = '0,0 12x12',
  centeredTall = '2.5,0 7x12',
  centeredBig = '2.5,2.5 7x7',
  centeredSmall = '3.5,3.5 5x5',
}

-- https://github.com/wincent/wincent
function chain(movements)
  local chainResetInterval = 2 -- seconds
  local cycleLength = #movements
  local sequenceNumber = 1

  return function()
    local win = hs.window.frontmostWindow()
    local id = win:id()
    local now = hs.timer.secondsSinceEpoch()
    local screen = win:screen()

    if
      lastSeenChain ~= movements or
      lastSeenAt < now - chainResetInterval or
      lastSeenWindow ~= id
    then
      sequenceNumber = 1
      lastSeenChain = movements
    end
    lastSeenAt = now
    lastSeenWindow = id

    hs.grid.set(win, movements[sequenceNumber], screen)
    sequenceNumber = sequenceNumber % cycleLength + 1
  end
end

hs.hotkey.bind(mash, 'left', chain({
  grid.leftHalf,
  grid.leftThird,
  grid.leftTwoThirds,
}))

hs.hotkey.bind(mash, 'right', chain({
  grid.rightHalf,
  grid.rightThird,
  grid.rightTwoThirds,
}))

hs.hotkey.bind(mash, 'up', chain({
  grid.fullScreen,
}))

hs.hotkey.bind(mash, 'down', chain({
  grid.centeredTall,
  grid.centeredBig,
  grid.centeredSmall,
}))

hs.hotkey.bind(mash, "=", function ()
  local win = hs.window.focusedWindow()

  hs.grid.resizeWindowWider(win)
  hs.grid.resizeWindowTaller(win)

  win:centerOnScreen()
end)

hs.hotkey.bind(mash, "-", function ()
  local win = hs.window.focusedWindow()

  hs.grid.resizeWindowThinner(win)
  hs.grid.resizeWindowShorter(win)

  win:centerOnScreen()
end)

hs.hotkey.bind(mash, 'return', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end)

-- Move window to specific screen
--
-- function moveWindowToDisplay(d)
--   return function()
--     local displays = hs.screen.allScreens()
--     local win = hs.window.focusedWindow()
--     win:moveToScreen(displays[d], false, true)
--   end
-- end
--
-- hs.hotkey.bind(mash, "1", moveWindowToDisplay(1))
-- hs.hotkey.bind(mash, "2", moveWindowToDisplay(2))
-- hs.hotkey.bind(mash, "3", moveWindowToDisplay(3))

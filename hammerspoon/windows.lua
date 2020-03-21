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
hs.hotkey.bind(mash, 'h', chain({
  grid.leftHalf,
  grid.leftThird,
  grid.leftTwoThirds,
}))

hs.hotkey.bind(mash, 'right', chain({
  grid.rightHalf,
  grid.rightThird,
  grid.rightTwoThirds,
}))
hs.hotkey.bind(mash, 'l', chain({
  grid.rightHalf,
  grid.rightThird,
  grid.rightTwoThirds,
}))

hs.hotkey.bind(mash, 'up', chain({
  grid.fullScreen,
}))
hs.hotkey.bind(mash, 'k', chain({
  grid.fullScreen,
}))

hs.hotkey.bind(mash, 'down', chain({
  grid.centeredTall,
  grid.centeredBig,
  grid.centeredSmall,
}))
hs.hotkey.bind(mash, 'j', chain({
  grid.centeredTall,
  grid.centeredBig,
  grid.centeredSmall,
}))

-- grow window
hs.hotkey.bind(mash, "=", function ()
  local win = hs.window.focusedWindow()

  hs.grid.resizeWindowWider(win)
  hs.grid.resizeWindowTaller(win)

  win:centerOnScreen()
end)

-- shrink window
hs.hotkey.bind(mash, "-", function ()
  local win = hs.window.focusedWindow()

  hs.grid.resizeWindowThinner(win)
  hs.grid.resizeWindowShorter(win)

  win:centerOnScreen()
end)

-- cycle window to next screen
hs.hotkey.bind(mash, 'return', function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  win:move(win:frame():toUnitRect(screen:frame()), screen:next(), true, 0)
end)

-- Select window by hint
hs.hotkey.bind(mash, "w", hs.hints.windowHints)

-- Experimental expose views
hs.hotkey.bind(mash,'i','Expose',function()
  expose = hs.expose.new(nil,{showThumbnails=true})
  expose:toggleShow()
end)


-- TODO: Handle running windows by name
-- function list_windows()
--    hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:title()) end)
-- end
-- hs.hotkey.bind(mash, "9", function() list_windows() end)


-- TODO: Move window to specific screen
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

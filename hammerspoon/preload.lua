----------------------------
-- Hammerspoon Configuration
----------------------------

mash = {"cmd", "alt", "ctrl", "shift"}

hs.window.animationDuration = 0

hs.hotkey.bind(mash, "`", function()
  hs.reload()
end)

hs.alert.show("Hammerspoon loaded")

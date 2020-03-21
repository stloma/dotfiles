---------------------
-- Display Management
---------------------

hs.hotkey.bind(mash, "0", function()
  hs.brightness.set(60)
  result = hs.brightness.get()
  hs.alert.show("brightness set to 60%")
end)

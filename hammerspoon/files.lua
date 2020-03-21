------------------
-- File Management
------------------

local HOME = os.getenv("HOME")

local open_folder = hs.chooser.new(function(directory)
  local shell_command = "/usr/bin/open " .. directory['path']
  hs.execute(shell_command)
end)

open_folder:choices({
      {
         ["text"] = "Documents\n",
         ["subText"] = "public docs",
         ["path"] = HOME .. "/Documents",
      },
      {
         ["text"] = "Downloads\n",
         ["subText"] = "downloads",
         ["path"] = HOME .. "/Downloads"
      },

})


hs.hotkey.bind(mash, "o", function() open_folder:show() end)

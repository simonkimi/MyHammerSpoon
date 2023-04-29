-- Window management

-- Defines for window maximize toggler
local frameCache = {}
local logger = hs.logger.new("windows")


function WinMoveScreen(how)
   local win = hs.window.focusedWindow()
   if how == "left" then
      win:moveOneScreenWest()
   elseif how == "right" then
      win:moveOneScreenEast()
   end
end

-- Toggle a window between its normal size, and being maximized
function ToggleWindowMaximized()
   local win = hs.window.focusedWindow()
   if frameCache[win:id()] then
      win:setFrame(frameCache[win:id()])
      frameCache[win:id()] = nil
   else
      frameCache[win:id()] = win:frame()
      win:maximize()
   end
end


      

function Center()
   local win = hs.window.focusedWindow()
   win:centerOnScreen()
end


-- Center of the screen
hs.hotkey.bind({"ctrl", "cmd"}, "C", Center)


-- Maximized
hs.hotkey.bind({"ctrl", "cmd"}, "Up", function ()
   local win = hs.window.focusedWindow()
   win:move(hs.layout.maximized)
end)

-- Move between screens
hs.hotkey.bind({"ctrl", "cmd"}, "Left",  hs.fnutils.partial(WinMoveScreen, "left"))
hs.hotkey.bind({"ctrl", "cmd"}, "Right", hs.fnutils.partial(WinMoveScreen, "right"))

hs.hotkey.bind({"cmd", "ctrl"}, "down", function()
   local win = hs.window.focusedWindow()
   win:moveToUnit({0,0,0.9,0.9})
   win:centerOnScreen()
end)
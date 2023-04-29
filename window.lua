function WinMoveScreen(how)
   local win = hs.window.focusedWindow()
   if how == "left" then
      win:moveOneScreenWest()
   elseif how == "right" then
      win:moveOneScreenEast()
   end
end

function Center()
   local win = hs.window.focusedWindow()
   win:centerOnScreen()
end

function HalfWindows(how)
   local win = hs.window.focusedWindow()
   local screen = win:screen()
   local frame = screen:frame()
   if how == "up" then
      win:setFrame({
         x = frame.x,
         y = frame.y,
         w = frame.w,
         h = frame.h / 2
      })
   elseif how == "down" then
      win:setFrame({
         x = frame.x,
         y = frame.y + frame.h / 2,
         w = frame.w,
         h = frame.h / 2
      })
   else
      if how == "left" then
         win:setFrame({
            x = frame.x,
            y = frame.y,
            w = frame.w / 2,
            h = frame.h
         })
      else
         if how == "right" then
            win:setFrame({
               x = frame.x + frame.w / 2,
               y = frame.y,
               w = frame.w / 2,
               h = frame.h
            })
         end
      end
   end
end

-- Center of the screen
hs.hotkey.bind({ "ctrl", "cmd" }, "C", Center)


-- Maximized
hs.hotkey.bind({ "ctrl", "cmd" }, "Up", function()
   local win = hs.window.focusedWindow()
   win:move(hs.layout.maximized)
end)

-- Move between screens
hs.hotkey.bind({ "ctrl", "cmd" }, "Left", hs.fnutils.partial(WinMoveScreen, "left"))
hs.hotkey.bind({ "ctrl", "cmd" }, "Right", hs.fnutils.partial(WinMoveScreen, "right"))
hs.hotkey.bind({ "shift", "cmd" }, "Up", hs.fnutils.partial(HalfWindows, "up"))
hs.hotkey.bind({ "shift", "cmd" }, "Down", hs.fnutils.partial(HalfWindows, "down"))
hs.hotkey.bind({ "shift", "cmd" }, "Left", hs.fnutils.partial(HalfWindows, "left"))
hs.hotkey.bind({ "shift", "cmd" }, "Right", hs.fnutils.partial(HalfWindows, "right"))

hs.hotkey.bind({ "cmd", "ctrl" }, "down", function()
   local win = hs.window.focusedWindow()
   win:moveToUnit({ 0, 0, 0.9, 0.9 })
   win:centerOnScreen()
end)

function IsCodeWindows()
    local codeWindows = { "CLion", "Code", "PyCharm", "Sublime Text", "WebStorm", "IntelliJ IDEA", "GLand" }
    local win = hs.window.focusedWindow()
    local app = win:application()
    local appName = app:name()
    for _, v in ipairs(codeWindows) do
        if v == appName then
            return true
        end
    end
    return false
end

function SendKey(key)
    hs.eventtap.keyStrokes(key)
end

hs.hotkey.bind("", "`", hs.fnutils.partial(SendKey, "`"))
hs.hotkey.bind("", "'", hs.fnutils.partial(SendKey, "'"))
hs.hotkey.bind("", "\\", hs.fnutils.partial(SendKey, "\\"))

hs.hotkey.bind("shift", "4", hs.fnutils.partial(SendKey, "$"))
hs.hotkey.bind("shift", "6", hs.fnutils.partial(SendKey, "^"))
hs.hotkey.bind("shift", "-", hs.fnutils.partial(SendKey, '_'))
hs.hotkey.bind("shift", "[", hs.fnutils.partial(SendKey, "{"))
hs.hotkey.bind("shift", "]", hs.fnutils.partial(SendKey, "}"))
hs.hotkey.bind("shift", "'", hs.fnutils.partial(SendKey, '"'))
hs.hotkey.bind("shift", ",", hs.fnutils.partial(SendKey, '<'))
hs.hotkey.bind("shift", ".", hs.fnutils.partial(SendKey, '>'))


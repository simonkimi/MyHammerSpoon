
function IsCodeWindows()
    local codeWindows = {"CLion", "Code"};
    local win = hs.window.focusedWindow()
    local app = win:application()
    local appName = app:name()
    for i, v in ipairs(codeWindows) do
        if v == appName then
            return true
        end
    end
    return false
end

function SendKey(key)
    if IsCodeWindows() then
        hs.eventtap.keyStrokes(key)
    end
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


function ReloadConfig(paths)
    DoReload = false
    for _, file in pairs(paths) do
        if file:sub(-4) == ".lua" then
            print("A lua config file changed, reload")
            DoReload = true
        end
    end
    if not DoReload then
        print("No lua file changed, skipping reload")
        return
    end

    hs.reload()
end

local configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", ReloadConfig)
configFileWatcher:start()

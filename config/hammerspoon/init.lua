-- https://www.hammerspoon.org/go/

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hyperkey = {"ctrl", "alt", "cmd", "shift"}

yyyymmdd = os.date("%Y-%m-%d")

-- automatically close older chrome windows
function chromeWatcherCallback(window, appName, event)
    app = hs.application.find("Google Chrome")
    for i, window in ipairs(app:allWindows()) do
        if i <= 3 then goto continue end
        window:close()
        ::continue::
    end
end

chromeWatcher = hs.window.filter.new("Google Chrome")
chromeWatcher:subscribe(hs.window.filter.windowCreated, chromeWatcherCallback)


-- close spotify window when unfocused
function closeSpotifyCallback(window, appName, event)
    window:close()
end
spotifyWatcher = hs.window.filter.new("Spotify")
spotifyWatcher:subscribe(hs.window.filter.windowUnfocused, closeSpotifyCallback)

--- Always position daily note in middle of screen when bear is first activated
function bearApplicationEvent(name, type, application)
    if name ~= "Bear" then
        return
    end
    if type ~= hs.application.watcher.activated then
        return
    end
    --- give bear some time to set window
    hs.timer.doAfter(0.1, function()
        window = application:focusedWindow()
        if window:title() == yyyymmdd then
            --- TODO: Replace this with proper window call
            hs.eventtap.keyStroke(hyperkey, "S")
        end
    end)
end
bearWatcher = hs.application.watcher.new(bearApplicationEvent)
bearWatcher:start()

-- Auto minimize Anki
ankiWatcher = hs.window.filter.new("Anki")
ankiWatcher:subscribe(hs.window.filter.windowUnfocused, function (window, appName, event)
    window:minimize()
end)

function closeUnfocusedWindows()
    focusedWindow = hs.window.focusedWindow()
    for key, window in pairs(focusedWindow:application():allWindows()) do
        if window ~= focusedWindow then
            window:close()
        end
    end
end

hs.hotkey.bind(hyperkey, "k", closeUnfocusedWindows)


-- TODO: automatically close chrome windows that are not visible for the last 10 minutes.

--- seems like the property for checking if a window is user-visible is whether its occluded.

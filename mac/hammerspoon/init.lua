
NOTIFY_TIMEOUT = 0.5  -- onscreen message timeout in seconds

function app(appBundleId)
    return {
        appBundleId = appBundleId,
        app = hs.application.find(appBundleId),
        icon = hs.image.imageFromAppBundle(appBundleId),
    }
end

function notify(message)
    hs.alert.show(message, {strokeWidth=10, strokeColor={white=0.75}, textSize=40}, hs.screen.mainScreen(), NOTIFY_TIMEOUT)
    print(message)
end

function notifyAllScreens(message)
    for i, screen in ipairs(hs.screen.allScreens()) do
        if not (screen == nil) then
            hs.alert.show(message, {strokeWidth=10, strokeColor={white=0.75}, textSize=40}, screen, NOTIFY_TIMEOUT)
        end
    end
    print(message)
end

function toggleMute()
    if not (zoom.app == nil) then
        hs.eventtap.keyStroke({"cmd","shift"}, "a", 0, zoom.app)
        hs.alert.showWithImage("Toggled Mute 🔇", zoom.icon)
    end
    if not (teams.app == null) then
        hs.eventtap.keyStroke({"cmd","shift"}, "m", 0, teams.app)
        hs.alert.showWithImage("Toggled Mute 🔇", teams.icon)
    end
end

function toggleVideo()
    if not (zoom.app == nil) then
        hs.eventtap.keyStroke({"cmd","shift"}, "v", 0, zoom.app)
        hs.alert.showWithImage("Toggled Video 🎥", zoom.icon)
    end
    if not (teams.app == null) then
        hs.eventtap.keyStroke({"cmd","shift"}, "o", 0, teams.app)
        hs.alert.showWithImage("Toggled Video 🎥", teams.icon)
    end
end

function switchMonitorInput(monitor, monitorInput)
    local cmd = string.format("/usr/local/bin/ddcctl -d %i -i %i", monitor.code, monitorInput.code)
    print(string.format("Executing '%s'",cmd))
    output, status, exit_type, rc = hs.execute(cmd)

    if (exit_type == "exit") then
        print(string.format("Exited with code %i", rc))
    else
        print(string.format("Terminated with signal %i", rc))
    end
    print(string.format("Stdout:\n%s", output))

    notifyAllScreens(string.format("🖥 Switched %s to %s", monitor.message, monitorInput.message))
end

monitors = {
    left  = {code=2, message="Left Monitor (Dell)"},
    right = {code=1, message="Right Monitor (Dell)"},
}

monitorInputs = {
    dp    = {code=15, message="DisplayPort"},
    hdmi1 = {code=17, message="HDMI Input 1"},
    hdmi2 = {code=18, message="HDMI Input 2"},
}

zoom = app("us.zoom.xos")
teams = app("com.microsoft.teams")

-- Bind Hotkeys
local ctrl_shift = {"ctrl", "shift"}
local hyper = {"cmd", "alt", "ctrl", "shift"}
hs.hotkey.bind({}, "f13", toggleMute)
hs.hotkey.bind({"shift"}, "f13", toggleVideo)

-- Left Monitor Hotkeys
hs.hotkey.bind(ctrl_shift, "pad7", (function() switchMonitorInput(monitors.left,  monitorInputs.dp) end))
hs.hotkey.bind(ctrl_shift, "pad4", (function() switchMonitorInput(monitors.left,  monitorInputs.hdmi2) end))
hs.hotkey.bind(ctrl_shift, "pad1", (function() switchMonitorInput(monitors.left,  monitorInputs.hdmi1) end))

-- Right Monitor Hotkeys
hs.hotkey.bind(ctrl_shift, "pad9", (function() switchMonitorInput(monitors.right, monitorInputs.dp) end))
hs.hotkey.bind(ctrl_shift, "pad6", (function() switchMonitorInput(monitors.right, monitorInputs.hdmi2) end))
hs.hotkey.bind(ctrl_shift, "pad3", (function() switchMonitorInput(monitors.right, monitorInputs.hdmi1) end))

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "escape", function ()
    if mouseEvent:isEnabled() then
        mouseEvent:stop()
        -- mouseUpEvent:stop()
        notify("Disabled")
    else
        mouseEvent:start()
        -- mouseUpEvent:start()
        notify("Enabled")
    end
end)

scrollPx = 50
mouseEvent = hs.eventtap.new(
    {hs.eventtap.event.types.leftMouseDown, hs.eventtap.event.types.rightMouseDown},
    function (event)
        if event:getButtonState(0) and event:getButtonState(3) and event:getButtonState(4) then
            -- notify("Scroll Left")
            -- hs.eventtap.scrollWheel({scrollPx, 0}, {})
        -- elseif event:getButtonState(0) and event:getButtonState(3) then
        --     -- notify("Previous Space")
        --     -- hs.eventtap.keyStroke({"cmd"}, "left", 10000)
        -- elseif event:getButtonState(1) and event:getButtonState(3) then
        --     -- notify("Next Space")
            -- hs.eventtap.keyStroke({"cmd"}, "right", 10000)
        elseif event:getButtonState(0) and event:getButtonState(4) then
            -- notify("Previous Tab")
            hs.eventtap.keyStroke({"alt", "cmd"}, "left", 10000)
        elseif event:getButtonState(1) and event:getButtonState(4) then
            -- notify("Next Tab")
            hs.eventtap.keyStroke({"alt", "cmd"}, "right", 10000)
        else
            return false
        end
        return true
    end
)
mouseEvent:start()

mouseUpEvent = hs.eventtap.new(
    {hs.eventtap.event.types.otherMouseDown, hs.eventtap.event.types.otherMouseUp},
    function (event)
        if event:getButtonState(2) then
            notify("Propagate middle click")
            return false
        else
            notify("Don't propagate button 3+ clicks")
            return true
        end
    end
)
-- mouseUpEvent:start()

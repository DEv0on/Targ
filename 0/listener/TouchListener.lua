--
-- Created by DEv0on.
-- Date: 23.06.2020
-- Time: 14:59
--

local TouchListener = {
    touchPlaces = {}
}

function TouchListener:createListener()
    return self
end

function TouchListener:addKeyEvent(place, event)
    table.insert(self.touchPlaces, {touch = place, event = event})
    return self
end

function TouchListener:listenForTouch(once)
    parallel.waitForAny(
        function()
            while true do
                ev, button, x, y = coroutine.yield("mouse_click")
                for k,v in pairs(self.touchPlaces) do
                    if x >= v.touch.x1 and y >= v.touch.y1 and x <= v.touch.x2 and y <= v.touch.y2 then
                        local status, ret = pcall(v.event)
                        if once or not status or ret == "zajeb kopa" then return true end
                    end
                end
            end
        end
    )
    return true
end

return TouchListener



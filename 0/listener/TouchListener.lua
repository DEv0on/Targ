--
-- Created by DEv0on.
-- Date: 23.06.2020
-- Time: 14:59
--

local TouchListener = {
    touchPos = {}
}

function TouchListener:createListener()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function TouchListener:addKeyEvent(place, event)
    table.insert(self.touchPos, {touch = place, event = event})
    return self
end

function TouchListener:listenForTouch(once)
    parallel.waitForAny(
        function()
            while true do
                ev, button, x, y = coroutine.yield("mouse_click")
                if x == nil or y == nil then return false end
                for k,v in pairs(self.touchPos) do
                    if x >= v.touch.x1 and y >= v.touch.y1 and x <= v.touch.x2 and y <= v.touch.y2 then
                        local status, ret = pcall(v.event)
                        if once or not status or ret == false then return true end
                    end
                end
            end
        end
    )
    return true
end

return TouchListener



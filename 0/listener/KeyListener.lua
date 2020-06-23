--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 00:55
--

local KeyListener = {
    keys = {}
}

function KeyListener:createListener()
    return self
end

function KeyListener:addKeyEvent(key, event)
    table.insert(self.keys, key, event)
    return self
end

function KeyListener:listenForKey(once)
    function wait()
        while true do
            ev, key = coroutine.yield("key")
            for k,v in pairs(self.keys) do
                if tonumber(k) == key then
                    local status, ret = pcall(v)
                    if once or not status or ret == "zajeb kopa" then return true end
                end
            end
        end
    end
   parallel.waitForAll(wait)
end

return KeyListener



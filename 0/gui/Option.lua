--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 01:04
--

Option = { text = "", event = function() end, option = true}

function Option:new(header, event)
    o = {}
    setmetatable(o, self)
    self.__index = self
    o.text = text
    o.event = event
    return o
end

function Option:setText(text)
    self.text = text
end

function Option:setEvent(event)
    self.event = event
end

return Option
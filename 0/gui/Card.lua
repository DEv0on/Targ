--
-- Created by DEv0on.
-- Date: 12.08.2020
-- Time: 23:41
--

Card = {header = "", options = {} }

function MainMenu:new()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

return Card
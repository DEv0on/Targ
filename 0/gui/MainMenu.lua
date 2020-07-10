--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 00:24
--

MainMenu = {options = {}, lowerOptions = {} }

function MainMenu:new(options, lowerOptions)
    o = {}
    setmetatable(o, self)
    self.__index = self
    o.options = options
    o.lowerOptions = lowerOptions
    return o
end


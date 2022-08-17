--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 00:24
--

MainMenu = {options = {}, lowerOptions = {} }

function MainMenu:new()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function append(option)
    if option.option == nil then
        error("Builder error: Object is not an option!")
    end

    table.insert(self.options, option)
end

function appendLower(option)
    if option.option == nil then
        error("Builder error: Object is not an option!")
    end
    
    table.insert(self.lowerOptions, option)
end

return MainMenu
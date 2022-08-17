--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 00:01
--

ItemList = {items = {}}

function ItemList:new(items)
    o = {}
    setmetatable(o, self)
    self.__index = self
    o.items = items
    return o
end

function ItemList:getItems()
    return self.items
end

function ItemList:setItems(items)
    self.items = items
end

function ItemList:addItem(item)
    if item.item ~= true then
        error("Object is not an Item instance!")
    end
    
    table.insert(self.items, item)
end

function ItemList:update()

end

function ItemList:run()

end

return ItemList

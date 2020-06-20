--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 00:01
--

ItemList = {items = {}}

function ItemList:new (items)
    self.items = items
    return self
end



function ItemList:getItems()
    return self.items
end

function ItemList:setItems(items)
    self.items = items
end

function ItemList:draw()

end

function ItemList:execute()

end

function ItemList:run()

end


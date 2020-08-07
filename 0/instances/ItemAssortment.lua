--
-- Created by DEv0on.
-- Date: 22.05.2020
-- Time: 01:50
--

Item = dofile("/instances/Item.lua")

local ItemAssortment = {
    id = 0,
    seller = "",
    item = {},
    qty = 1,
    price = 1,
    currency = {},
    discount = 1,
    soldQuantity = 0,
    date = 0
}

function ItemAssortment:newByTable(tab)
    if type(tab) ~= "table" then
        error("Not a table")
    end
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.id = tab.id
    o.seller = tab.seller
    o.item = Item:newByTable(tab.item)
    o.qty = tab.qty
    o.price = tab.price
    o.currency = Item:newByTable(tab.currency)
    o.discount = tab.discount
    o.soldQuantity = tab.soldQuantity
    --ToDo: set date
    return o
end

function ItemAssortment:new(id, seller, item, qty, price, discount, currency, soldQuantity)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.id = id
    o.seller = seller
    o.item = item
    o.qty = qty
    o.price = price
    o.currency = currency
    o.discount = discount
    o.soldQuantity = soldQuantity
    --ToDo: set date
    return o
end


function ItemAssortment:getID()
    return self.id
end

function ItemAssortment:getSeller()
    return self.seller
end

function ItemAssortment:getItem()
    return self.item
end

function ItemAssortment:getQuantity()
    return self.qty
end

function ItemAssortment:getBasePrice()
    return self.price
end

function ItemAssortment:getPrice()
    return self.price * self.discount
end

function ItemAssortment:getDiscount()
    return self.discount
end

function ItemAssortment:getCurrency()
    return self.currency
end

function ItemAssortment:getSoldQuantity()
    return self.soldQuantity
end

function ItemAssortment:setItem(item)
    self.item = item
    return true
end

function ItemAssortment:setQuantity(qty)
    self.qty = qty
    return true
end

function ItemAssortment:setPrice(price)
    self.price = price
    return true
end

function ItemAssortment:setDiscount(discount)
    self.discount = discount
    return true
end

--tak

function ItemAssortment:increaseSoldQty(qty)
    local newQty = self.soldQuantity+qty
    self.soldQuantity = newQty
    return true
end

return ItemAssortment
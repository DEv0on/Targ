--
-- Created by DEv0on.
-- Date: 22.05.2020
-- Time: 01:50
--

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

function ItemAssortment:new(id, seller, item, qty, price, discount, currency, soldQuantity)
    self.id = id
    self.seller = seller
    self.item = item
    self.qty = qty
    self.price = price
    self.currency = currency
    self.discount = discount
    self.soldQuantity = soldQuantity
    --ToDo: set date
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
    return self.price * self.priceDiscount
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
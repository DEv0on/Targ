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

function getID()
    return self.id
end

function getSeller()
    return self.seller
end

function getItem()
    return self.item
end

function getQuantity()
    return self.qty
end

function getBasePrice()
    return self.price
end

function getPrice()
    return self.price * self.priceDiscount
end

function getDiscount()
    return self.discount
end

function getCurrency()
    return self.currency
end

function getSoldQuantity()
    return self.soldQuantity
end

function setItem(item)
    self.item = item
    return true
end

function setQuantity(qty)
    self.qty = qty
    return true
end

function setPrice(price)
    self.price = price
    return true
end

function setDiscount(discount)
    self.discount = discount
    return true
end

--tak

function increaseSoldQty(qty)
    local newQty = self.soldQuantity+qty
    self.soldQuantity = newQty
    return true
end

return ItemAssortment
--
-- Created by DEv0on.
-- Date: 22.05.2020
-- Time: 01:56
--

local Item = {
    id = "",
    dmg = 0,
    nbt_hash = "",
    qty = 0
}

function Item:newByTable(tab)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.id = tab.id
    o.dmg = tab.dmg
    o.nbt_hash = tab.nbt_hash
    o.qty = tab.qty
    return o
end

function Item:new(id, dmg, nbt_hash, qty)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.id = id
    o.dmg = dmg
    o.nbt_hash = nbt_hash
    o.qty = qty
    return o
end


function Item:getID()
    return self.id
end

function Item:getDmg()
    return self.dmg
end

function Item:getNBT()
    return self.nbt_hash
end

function Item:getQuantity()
    return self.qty
end

function Item:setID(id)
    self.id = id
    return true
end

function Item:setDmg(dmg)
    self.dmg = dmg
    return true
end

function Item:setNBT(nbt)
    self.nbt_hash = nbt
    return true
end

function Item:setQuantity(qty)
    self.qty = qty
    return true
end

function Item:equals(item)
    if self:getID() == item:getID() and self:getDmg() == item:getDmg() and (self:getNBT() == item:getNBT() or self:getNBT() == nil or self:getNBT() == "") then
        return true
    end
    return false
end

return Item
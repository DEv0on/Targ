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

function Item:new(id, dmg, nbt, qty)
    self.id = id
    self.dmg = dmg
    self.nbt_hash = nbt
    self.qty = qty
    return self
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
    if self.id == item.id and self.dmg == item.dmg and self.nbt_hash == item.nbt_hash then
        return true
    end
    return false
end

return Item
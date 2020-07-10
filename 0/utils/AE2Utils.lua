--
-- Created by DEv0on
-- Date: 23.06.2020
-- Time: 17:24
--

AE2Utils = {}

function AE2Utils.getFingerprint(id,dmg,nbt)
    if nbt == "" then
        return {id= tostring(id), dmg= tonumber(dmg)}
    else
        return {id = tostring(id), dmg = tonumber(dmg), nbt_hash = tostring(nbt)}
    end
end

function AE2Utils.getItemQty(fingerprint,AE2)
    itemList = AE2.getAvailableItems()
    for k,v in pairs(itemList) do
        if v.fingerprint.id == fingerprint.id and v.fingerprint.dmg == fingerprint.dmg and v.fingerprint.nbt_hash == fingerprint.nbt_hash then
            return v.size
        end
    end
    return 0
end

return AE2Utils
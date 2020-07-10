--
-- Created by DEv0on
-- Date: 23.06.2020
-- Time: 16:30
--

JSON = dofile("/utils/JSON.lua")
FileUtil = dofile("/utils/FileUtil.lua")
AE2Utils = dofile("/utils/AE2Utils.lua")
Item     = dofile("/instances/Item.lua")

BuyUtils = {}

local status, settings = pcall(function () return JSON.decode(FileUtil.readAll("/.shopsettings")) end)

--PIM EDITION
function BuyUtils.buy(assortmentItem)

    if status ~= true then
        return false, "Blad odczytu ustawien!"
    end

    local pim = peripheral.find("pim")
    local AE2 = peripheral.wrap(settings.interfaceToPimID)

    if pim == nil or pim.getInventoryName() == "pim" then
        return false, "Nie stoisz na PIM"
    end

    if AE2 == nil or AE2.getStoredPower() < 1000 then
        return false, "Nie znaleziono AE2"
    end

    local itemFingerprint = AE2Utils.getFingerprint(assortmentItem:getItem():getID(), assortmentItem:getItem():getDmg(), assortmentItem:getItem():getNBT())
    local itemQtyAE2 = AE2Utils.getItemQty(itemFingerprint, AE2)

    if itemQtyAE2 < assortmentItem:getQuantity() then
        return false, "Brak w asortymencie!"
    end

    local currencyFound = false

    for i=1,36 do
        item = pim.getStackInSlot(i)
        if item ~= nil then
            if assortmentItem:getCurrency():equals(Item:new(item.id, item.dmg, item.nbt_hash, item.qty)) and item.qty >= assortmentItem:getPrice() then
                currencyFound = true
                pim.pushItem(settings.pimToInterfaceDir, i, assortmentItem:getPrice())
                break
            end
        end
    end

    if not currencyFound then
        return false, "Nie posiadasz pieniedzy!"
    end

    for i=1,math.floor(assortmentItem.qty/64) do
        AE2.exportItem(itemFingerprint, settings.interfaceToPimDir, 64)
    end
    AE2.exportItem(itemFingerprint, settings.interfaceToPimDir, assortmentItem.qty%64)
    return true, "OK"
end

return BuyUtils
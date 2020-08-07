--
-- Created by DEv0on
-- Date: 23.06.2020
-- Time: 16:30
--

JSON = dofile("/utils/JSON.lua")
UserUtil = dofile("/utils/UserUtil.lua")
FileUtil = dofile("/utils/FileUtil.lua")
AE2Utils = dofile("/utils/AE2Utils.lua")
Item     = dofile("/instances/Item.lua")
ItemAssortment = dofile("/instances/ItemAssortment.lua")

BuyUtils = {}

local status, settings = pcall(function () return JSON.decode(FileUtil.readAll("/.shopsettings")) end)

--PIM EDITION
function BuyUtils.buy(assortmentItem)

    local user = UserUtil.getUserByUsername(assortmentItem:getSeller())

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

    for i=1,math.floor(assortmentItem:getQuantity()/64) do
        AE2.exportItem(itemFingerprint, settings.interfaceToPimDir, 64)
    end
    AE2.exportItem(itemFingerprint, settings.interfaceToPimDir, assortmentItem:getQuantity()%64)



    UserUtil.updateRefunds(user, assortmentItem, pim.getInventoryName())



    return true, "OK"
end

function BuyUtils.refund()
    if status ~= true then
        return false, "Blad odczytu ustawien!"
    end

    local pim = peripheral.find("pim")
    local AE2 = peripheral.wrap(settings.interfaceToPimID)

    if pim == nil or pim.getInventoryName() == "pim" then
        return false, "Nie stoisz na PIM"
    end

    local refunds = JSON.decode(FileUtil.readAll("/data/other/refunds.json"))
    local refundData

    for k,v in pairs(refunds) do
        if v.username == pim.getInventoryName() then
            v.data.itemBought = JSON.decode(v.data.itemBought)
            refundData = v.data
        end
    end

    if refundData == nil then
        return false, "Nie dokonales ostatnio zakupu!"
    end

    --[[
    if refundData.time < currentTime then
        return false, "Czas na zwrot minal!"
    end
    ]]

    if AE2 == nil or AE2.getStoredPower() < 1000 then
        return false, "Nie znaleziono AE2"
    end

    local itemAssortment = ItemAssortment:newByTable(refundData.itemBought)
    local itemsCount = itemAssortment:getQuantity()
    local itemsToReturn = {}

    local itemFpCurr = AE2Utils.getFingerprint(itemAssortment:getCurrency():getID(), itemAssortment:getCurrency():getDmg(), itemAssortment:getCurrency():getNBT())
    local itemQtyAE2 = AE2Utils.getItemQty(itemFpCurr, AE2)

    if itemQtyAE2 < itemAssortment:getPrice() then
        return false,"Brak waluty do zwrotu"
    end

    for i=1,36 do
        item = pim.getStackInSlot(i)
        if item ~= nil then
            if itemAssortment:getItem():equals(Item:newByTable(item)) then
                if (item.qty > itemsCount) then
                    table.insert(itemsToReturn, i, {data = item, qty = itemsCount})
                    itemsCount = 0
                    break
                end
                table.insert(itemsToReturn, i, {data = item, qty = item.qty})
                itemsCount = itemsCount - item.qty
            end
        end
    end
    if (itemsCount >0) then
        return false, "Nie posiadasz przedmiotow"
    end

    for k,v in pairs(itemsToReturn) do
        local itemPim = pim.getStackInSlot(k)
        local item = Item:new(itemPim.id, itemPim.dmg, itemPim.nbt_hash, itemPim.qty)
        if not item:equals(Item:newByTable(v.data)) then
            return false, "Nastapila proba oszustwa!"
        end
        pim.pushItem(settings.pimToInterfaceDir, k, v.qty)
    end
    local itemFingerprint = AE2Utils.getFingerprint(itemAssortment:getCurrency():getID(), itemAssortment:getCurrency():getDmg(), itemAssortment:getCurrency():getNBT())
    for i=1,math.floor(itemAssortment:getPrice()/64) do
        AE2.exportItem(itemFingerprint, settings.interfaceToPimDir, 64)
    end
    AE2.exportItem(itemFingerprint, settings.interfaceToPimDir, itemAssortment:getPrice()%64)
end

return BuyUtils
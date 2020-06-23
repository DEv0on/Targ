--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 01:06
--
FileUtil    = dofile("/utils/FileUtil.lua")
JSON        = dofile("/utils/JSON.lua")


User = {username = "", expireTime = 0, assortment = {}, wallet = {}}

function User:new(username, expireTime, assortment, wallet)
    if type(username) ~= "string" then
        error("username is not a valid string")
    end
    if type(expireTime) ~= "number" then
        error("expireTime is not a valid number")
    end
    if type(assortment) ~= "table" then
        error("items is not a valid table")
    end
    if type(wallet) ~= "table" then
        error("wallet is not a valid table")
    end

    self.username = username
    self.expireTime = expireTime
    self.assortment = assortment
    self.wallet = wallet
    return self
end

function User:save()
    --ToDo: rework a save function
    local userInfo = {username = self.username, expireTime = self.expireTime}
    local w1 = FileUtil.writeToFile("/data/users/"..self.username.."/info.json", JSON.encode(userInfo))
    local w2 = FileUtil.writeToFile("/data/users/"..self.username.."/wallet.json", JSON.encode({wallet = self.wallet}))
    local w3 = FileUtil.writeToFile("/data/users/"..self.username.."/assortment.json", JSON.encode({assortment = self.assortment}))
    if not w1 or not w2 or not w3 then
        return false
    end
    return true
end

function User:getUsername()
    return self.username
end

function User:getExpireTime()
    return self.expireTime
end

function User:getWallet()
    return self.wallet
end

function User:getAssortment()
    return self.assortment
end

function User:setUsername(username)
    if type(username) ~= "string" then
        error("username is not a valid string")
    end
    self.username = username
end

function User:setExpireTime(expireTime)
    if type(expireTime) ~= "number" then
        error("expireTime is not a valid number")
    end
    self.expireTime = expireTime
end

function User:setWallet(wallet)
    if type(assortment) ~= "table" then
        error("items is not a valid table")
    end
    self.wallet = wallet
end

function User:setAssortment(assortment)
    if type(wallet) ~= "table" then
        error("wallet is not a valid table")
    end
    self.assortment = assortment
end

return User
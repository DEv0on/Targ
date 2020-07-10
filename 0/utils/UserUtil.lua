--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 01:28
--

FileUtil    = dofile("/utils/FileUtil.lua")
JSON        = dofile("/utils/JSON.lua")
User        = dofile("/instances/User.lua")

local UserUtil = {}

function UserUtil.getUserByUsername(username)
    local userList = fs.list("/data/users/")
    for key,username1 in pairs(userList) do
        if string.lower(username1) == string.lower(username) then
            local c1 = JSON.decode(FileUtil.readAll("/data/users/"..username1.."/info.json"))
            local c2 = JSON.decode(FileUtil.readAll("/data/users/"..username1.."/wallet.json"))
            local c3 = JSON.decode(FileUtil.readAll("/data/users/"..username1.."/assortment.json"))
            return User:new(c1.username, c1.expireTime, c2.wallet, c3.assortment)
        end
    end
    return nil
end

--ToDo: updateWallet function
function UserUtil.updateWallet(user, item)
    local wallet = user.wallet

    for k, v in pairs(wallet) do
        if v.equals(item) then
            v.qty = v.qty + item.qty
            return true
        end
    end
    
    table.insert(wallet, item)
    return true
end

return UserUtil
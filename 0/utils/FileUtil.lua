--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 14:06
--
local FileUtil = {}

function FileUtil.readAll(file)
    local f = assert(io.open(file,"r"))
    local content = f:read()
    f:close()
    return content
end

function FileUtil.writeToFile(file, data)
    local f = io.open(file, "wb")
    local function writeData()
        f:write(data)
    end
    local ran, err = pcall(writeData)
    f:close()
    local content = FileUtil.readAll(file)

    if not ran or content ~= data then
        return false
    end
    return true
end

local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function isFileExists(filename)
    local file = io.open(filename, "rb")
    if file then
        file:close()
        return true
    end
    return false
end

return FileUtil


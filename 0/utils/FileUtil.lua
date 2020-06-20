--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 14:06
--
local FileUtil = {}

function FileUtil.readAll(file)
    local f = assert(io.open(file,"rb"))
    local content = f:read("*all")
    f:close()
    return content
end

function FileUtil.writeToFile(file, data)
    local f = fs.open(file, "w")
    local ran, err = pcall(f:write(data))
    f.close()
    local content = FileUtil.readAll(file)

    if not ran or content ~= data then
        return false
    end
    return true
end

return FileUtil


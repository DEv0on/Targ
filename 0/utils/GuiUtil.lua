--
-- Created by DEv0on.
-- Date: 21.05.2020
-- Time: 14:17
--

local GuiUtil = {}

function GuiUtil.getResolution()
    x, y = term.getSize()
    x = (math.floor(x/2)*2)-2
    y = (math.floor(y/2)*2)
    return x, y
end

function GuiUtil.line(doReturn, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    if doReturn == nil then
        doReturn = 0
    elseif doReturn == 1 then
    else
        doReturn = 0
    end
    result = ""
    for i=1, x do
        result = result.."-"
    end
    if doReturn == 0 then
        print(result)
    else
        return(result)
    end
end

function GuiUtil.table1xLn(doReturn, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    if doReturn == nil then
        doReturn = 0
    elseif doReturn == 1 then
    else
        doReturn = 0
    end
    result = " +"
    for i=1, (x-1) do
        result = result.."-"
    end
    result = result.."+"
    if doReturn == 0 then
        print(result)
    else
        return(result)
    end
end

function GuiUtil.table2xLn(doReturn, xI, yI, sel)
    getResolution()
    sel = sel or 0
    sel = math.ceil(sel)
    if sel > 2 then
        sel = 0
    end
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    if doReturn == nil then
        doReturn = 0
    elseif doReturn == 1 then
    else
        doReturn = 0
    end
    result = " +"
    for i=1, 2 do
        for c=1, math.floor((x-2)/2) do
            if sel == i then
                result = result.."="
            else
                result = result.."-"
            end
        end
        result = result.."+"
    end
    if doReturn == 0 then
        print(result)
    else
        return(result)
    end
end

function GuiUtil.table1x( cell1, doReturn, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    stringLimit = (x-2)
    if doReturn == nil or doReturn ~= 1 then
        doReturn = 0
    else
        doReturn = 1
    end
    if cell1 == nil then
        cell1 = ""
    end
    if string.len( cell1 ) > stringLimit then
        print("table1x:cell1 > "..stringLimit)
    else
        brake1 = ""
        limit1 = stringLimit - string.len( cell1 )
        for i1=1, limit1 do
            brake1 = brake1.." "
        end
        result = " | ".. cell1..brake1.."|"
        if doReturn == 0 then
            print(result)
        else
            return(result)
        end
    end
end

function GuiUtil.table2x( cell1, cell2, doReturn, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    stringLimit = math.floor((x)/2)-2
    if doReturn == nil or doReturn ~= 1 then
        doReturn = 0
    else
        doReturn = 1
    end
    if cell1 == nil then
        cell1 = ""
    end
    if cell2 == nil then
        cell2 = ""
    end
    if string.len( cell1 ) > stringLimit then
        print("table2x:cell1 > "..stringLimit)
    elseif string.len( cell2 ) > stringLimit then
        print("table2x:cell2 > "..stringLimit)
    else
        brake1 = ""
        brake2 = ""
        limit1 = stringLimit - string.len( cell1 )
        limit2 = stringLimit - string.len( cell2 )
        for i1=1, limit1 do
            brake1 = brake1.." "
        end
        for i2=1, limit2 do
            brake2 = brake2.." "
        end
        result = " | "..cell1..brake1.."| "..cell2..brake2.."|"
        if doReturn == 0 then
            print(result)
        else
            return(result)
        end
    end
end

function GuiUtil.table4xLn()
    print(" +-------+-------+---------------------+---------+")
end

function GuiUtil.table4x( cell1, cell2, cell3, cell4, doReturn, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    -- 3+3+4+8
    stringLimit1 = 6
    stringLimit2 = 6
    stringLimit3 = 20
    stringLimit4 = 8
    if doReturn == nil or doReturn ~= 1 then
        doReturn = 0
    else
        doReturn = 1
    end
    if cell1 == nil then
        cell1 = ""
    end
    if cell2 == nil then
        cell2 = ""
    end
    if cell3 == nil then
        cell3 = ""
    end
    if cell4 == nil then
        cell4 = ""
    end


    if string.len( cell3 ) > stringLimit3 then
        cell3 = cell3:reverse():sub(#cell3-stringLimit3+4):reverse()
        cell3 = cell3.."..."
    end
    brake1 = ""
    brake2 = ""
    brake3 = ""
    brake4 = ""
    limit1 = stringLimit1 - string.len( cell1 )
    limit2 = stringLimit2 - string.len( cell2 )
    limit3 = stringLimit3 - string.len( cell3 )
    limit4 = stringLimit4 - string.len( cell4 )
    for i1=1, limit1 do
        brake1 = brake1.." "
    end
    for i2=1, limit2 do
        brake2 = brake2.." "
    end
    for i3=1, limit3 do
        brake3 = brake3.." "
    end
    for i4=1, limit4 do
        brake4 = brake4.." "
    end
    result = " | "..cell1..brake1.."| "..cell2..brake2.."| "..cell3..brake3.."| "..cell4..brake4.."|"
    if doReturn == 0 then
        print(result)
    else
        return(result)
    end
end

function GuiUtil.table4xColor( cell1, cell2, cell3, cell4, color, doReturn, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    -- 3+3+4+8
    stringLimit1 = 6
    stringLimit2 = 6
    stringLimit3 = 20
    stringLimit4 = 8
    if doReturn == nil or doReturn ~= 1 then
        doReturn = 0
    else
        doReturn = 1
    end
    if cell1 == nil then
        cell1 = ""
    end
    if cell2 == nil then
        cell2 = ""
    end
    if cell3 == nil then
        cell3 = ""
    end
    if cell4 == nil then
        cell4 = ""
    end
    if string.len( cell1 ) > stringLimit1 then
        print("table4x:cell1 > "..stringLimit1)
    elseif string.len( cell2 ) > stringLimit2 then
        print("table4x:cell2 > "..stringLimit2)
    elseif string.len( cell3 ) > stringLimit3 then
        print("table4x:cell3 > "..stringLimit3)
    elseif string.len( cell4 ) > stringLimit4 then
        print("table4x:cell4 > "..stringLimit4)
    else
        brake1 = ""
        brake2 = ""
        brake3 = ""
        brake4 = ""
        limit1 = stringLimit1 - string.len( cell1 )
        limit2 = stringLimit2 - string.len( cell2 )
        limit3 = stringLimit3 - string.len( cell3 )
        limit4 = stringLimit4 - string.len( cell4 )
        for i1=1, limit1 do
            brake1 = brake1.." "
        end
        for i2=1, limit2 do
            brake2 = brake2.." "
        end
        for i3=1, limit3 do
            brake3 = brake3.." "
        end
        for i4=1, limit4 do
            brake4 = brake4.." "
        end
        result = {" | ",colors.white,cell1,color,brake1,colors.white,"| ",colors.white,cell2,color,brake2,colors.white,"| ",colors.white,cell3,color,brake3,colors.white,"| ",colors.white,cell4,color,brake4,colors.white,"| ",colors.white}
        if doReturn == 0 then
            for i=1,#result do
                if i%2 == 0 then
                    term.setTextColor(result[i])
                    write(result[i-1])
                    if i == #result then
                        print()
                    end

                end
            end
        else
            return(result)
        end
    end
end

function GuiUtil.table1xColor( key, cell1, color, color2, doReturn, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    stringLimit = (x-2)
    if doReturn == nil or doReturn ~= 1 then
        doReturn = 0
    else
        doReturn = 1
    end
    if cell1 == nil then
        cell1 = ""
    end
    if string.len( cell1 ) > stringLimit then
        print("table1x:cell1 > "..stringLimit)
    else
        brake1 = ""
        limit1 = stringLimit - string.len( cell1.."["..key.."] " )
        for i1=1, limit1 do
            brake1 = brake1.." "
        end
        result = " | ".. cell1..brake1.."|"
        if doReturn == 0 then
            term.setTextColor(colors.white)
            write(" | ")
            term.setTextColor(color)
            write("["..key.."] ")
            term.setTextColor(color2)
            write(cell1..brake1)
            term.setTextColor(colors.white)
            write("|")
            print("")
        else
            return(result)
        end
    end
end

function GuiUtil.table2xColor( cell1, cell2, color, color2, doReturn, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    stringLimit = math.floor((x)/2)-2
    if doReturn == nil or doReturn ~= 1 then
        doReturn = 0
    else
        doReturn = 1
    end
    if cell1 == nil then
        cell1 = ""
    end
    if cell2 == nil then
        cell2 = ""
    end
    if string.len( cell1 ) > stringLimit then
        print("table2x:cell1 > "..stringLimit)
    elseif string.len( cell2 ) > stringLimit then
        print("table2x:cell2 > "..stringLimit)
    else
        brake1 = ""
        brake2 = ""
        limit1 = stringLimit - string.len( cell1 )
        limit2 = stringLimit - string.len( cell2 )
        for i1=1, limit1 do
            brake1 = brake1.." "
        end
        for i2=1, limit2 do
            brake2 = brake2.." "
        end
        result = " | "..""..cell1..brake1.."| "..""..cell2..brake2.."|"
        if doReturn == 0 then
            term.setTextColor(colors.white)
            write(" | ")
            term.setTextColor(color)
            write(cell1..brake1)
            term.setTextColor(colors.white)
            write("| ")
            term.setTextColor(color2)
            write(cell2..brake2)
            term.setTextColor(colors.white)
            write("|")
            print("")
        else
            return(result)
        end
    end
end



function GuiUtil.prgBar(progressTime, size, tab, prgChar, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    if progressTime == nil then
        print("gui.prgBarSmall error: missing argument, no time specified")
        print("Usage: gui.prgBar(<time>, <size[1,2,3]>, <border[0,1]>, <char>)")
    else
        if tab == 1 then
            tab = "|"
        else
            tab = " "
        end
        if prgChar == nil then
            prgChar = "#"
        end
        if size == nil or size > 2 then
            multiplier = x
            begChar = 2
            endChar = multiplier + 2
        elseif size == 2 then
            multiplier = math.floor((x-1)*0.4)
            begChar = math.floor((x - multiplier)/2)
            endChar = begChar + multiplier + 1
        else
            multiplier = math.floor((x-1)*0.19)
            begChar = math.floor((x - multiplier)/2)
            endChar = begChar + multiplier + 1
        end
        progressTime = progressTime / multiplier
        row, line = term.getCursorPos()
        term.setCursorPos(begChar, line)
        term.clearLine()
        term.setCursorPos(endChar, line)
        term.write(tab)
        term.setCursorPos(begChar, line)
        term.write(tab)
        for i=(begChar+1), (endChar-1) do
            term.setCursorPos(i, line)
            term.write(prgChar)
            sleep(progressTime)
        end
        term.setCursorPos(1, line+1)
    end
end

function GuiUtil.menuList(curPos, menuItems, printFunc, catchFunc, lockTerm)
    local function menuListCatchEvent()
        if lockTerm ~= 1 then
            menuListEv, menuListArg = os.pullEvent("key")
        else
            menuListEv, menuListArg = coroutine.yield("key")
        end

        if menuListArg == 200 then
            if curPos > 1 then
                curPos = curPos - 1
                return curPos
            end
        elseif menuListArg == 208 then
            if curPos < #menuItems then
                curPos = curPos + 1
                return curPos
            end
        elseif menuListArg == 28 then
            return true
        end

        return curPos
    end

    if printFunc == nil then
        printFunc = print
    end
    if catchFunc == nil then
        catchFunc = menuListCatchEvent
    end

    for i=1, #menuItems do
        if i == curPos then
            printFunc("[ "..menuItems[i].." ]")
        else
            printFunc(menuItems[i])
        end
    end
    return catchFunc()
end


function GuiUtil.menuList_pos_only(curPos, menuItems, lockTerm)
    if lockTerm ~= 1 then
        menuListEv, menuListArg = os.pullEvent("key")
    else
        menuListEv, menuListArg = coroutine.yield("key")
    end

    if menuListArg == 200 then
        if curPos > 1 then
            curPos = curPos - 1
            return curPos
        end
    elseif menuListArg == 208 then
        if curPos < #menuItems then
            curPos = curPos + 1
            return curPos
        end
    elseif menuListArg == 28 then
        return true
    end

    return curPos
end

function GuiUtil.windowSimpleColor(inp, color, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    tabulate = math.floor(x*0.21)
    stringLimit = x - (tabulate*2) - 1
    windowLine = "+-"
    for i=1, stringLimit do
        windowLine = windowLine.."-"
    end
    windowLine = windowLine.."-+"
    local function formatLn(text)
        if string.len(text) > stringLimit then
            return "windowSimple(): string > "..stringLimit
        else
            for i=1, (stringLimit - string.len(text)) do
                text = text.." "
            end
            return text
        end
    end
    line = 5
    limit = table.getn(inp)
    if limit > 7 then
        limit = 7
    end
    term.setTextColor(color)
    term.setCursorPos(tabulate, line)
    term.write(windowLine)
    line = line + 1
    for i=1, limit do
        term.setCursorPos(tabulate, line)

        term.write("| "..formatLn(inp[i]).." |")
        line = line + 1
    end
    term.setCursorPos(tabulate, line)
    term.write(windowLine)
    line = line + 1
    term.setTextColor(colors.white)

    term.setCursorPos(1, line)
end

function GuiUtil.windowSimple(inp, xI, yI)
    getResolution()
    if xI ~= nil or yI ~= nil then
        x = xI
        y = yI
    end
    tabulate = math.floor(x*0.21)
    stringLimit = x - (tabulate*2) - 1
    windowLine = "+-"
    for i=1, stringLimit do
        windowLine = windowLine.."-"
    end
    windowLine = windowLine.."-+"
    local function formatLn(text)
        if string.len(text) > stringLimit then
            text= text:reverse():sub(#text-27+4):reverse()
            text= text.."..."
        else
            for i=1, (stringLimit - string.len(text)) do
                text = text.." "
            end

        end
        return text
    end
    line = 5
    limit = table.getn(inp)
    if limit > 7 then
        limit = 7
    end
    term.setCursorPos(tabulate, line)
    term.write(windowLine)
    line = line + 1
    for i=1, limit do
        term.setCursorPos(tabulate, line)
        term.write("| "..formatLn(inp[i]).." |")
        line = line + 1
    end
    term.setCursorPos(tabulate, line)
    term.write(windowLine)
    line = line + 1
    term.setCursorPos(1, line)
end

function GuiUtil.windowSimpleInput(inp, limit, hide, lock, xI, yI)
    sleep(0.1)
    local inpTmp = inp
    for i=1, 7 do
        if i>5 then
            inpTmp[i] = nil
        end
    end

    if limit == nil then
        limit = 10
    end

    table.insert(inpTmp, "")
    windowInputLine = table.getn(inpTmp) + 1
    inpTmp[windowInputLine] = "#: _"
    windowInpRead = {}
    windowInp = {}
    windowSimpleInputReturns = nil


    while true do
        windowSimple(inp, xI, yI)
        if lock == true then
            windowInputEv, windowInputArg = coroutine.yield()
        else
            windowInputEv, windowInputArg = os.pullEvent()
        end

        if windowInputEv == "key" then
            if windowInputArg == 28 or windowInputArg == 156 then -- if press enter
                break
            elseif windowInputArg == 15 then
                return "fsduiqwsgfiqwghfiqwegfiuqwegfuqwgefuqwgef"
            elseif windowInputArg == 14 then -- if press backspace
                if table.getn(windowInpRead) ~= 0 then
                    windowInpRead[table.getn(windowInpRead)] = nil
                end
            end

        elseif windowInputEv == "char" then -- if inser char

            if table.getn(windowInpRead) ~= limit then
                table.insert(windowInpRead, windowInputArg)
            end

        end

        -- print section
        inpTmp[windowInputLine] = ""

        for i=1, table.getn(windowInpRead) do
            inpTmp[windowInputLine] = inpTmp[windowInputLine]..windowInpRead[i]
        end

        windowSimpleInputReturns = inpTmp[windowInputLine]

        if hide == true then
            inpTmp[windowInputLine] = "#: "..string.gsub(inpTmp[windowInputLine], ".", "*").."_"
        else
            inpTmp[windowInputLine] = "#: "..inpTmp[windowInputLine].."_"
        end

    end

    return windowSimpleInputReturns

end

function GuiUtil.windowSimpleInputColor(inp, color, limit, hide, lock, xI, yI)
    sleep(0.1)
    inpTmp = inp
    for i=1, 5 do
        if i>3 then
            inpTmp[i] = nil
        end
    end

    if limit == nil then
        limit = 10
    end

    table.insert(inpTmp, "")
    windowInputLine = table.getn(inpTmp) + 1
    inpTmp[windowInputLine] = "#: _"
    windowInpRead = {}
    windowInp = {}
    windowSimpleInputReturns = nil


    while true do
        windowSimpleColor(inp, color, xI, yI)
        if lock == true then
            windowInputEv, windowInputArg = coroutine.yield()
        else
            windowInputEv, windowInputArg = os.pullEvent()
        end

        if windowInputEv == "key" then
            if windowInputArg == 28 or windowInputArg == 156 then -- if press enter
                break
            elseif windowInputArg == 15 then
                return "fsduiqwsgfiqwghfiqwegfiuqwegfuqwgefuqwgef"
            elseif windowInputArg == 14 then -- if press backspace
                if table.getn(windowInpRead) ~= 0 then
                    windowInpRead[table.getn(windowInpRead)] = nil
                end
            end

        elseif windowInputEv == "char" then -- if inser char

            if table.getn(windowInpRead) ~= limit then
                table.insert(windowInpRead, windowInputArg)
            end

        end

        -- print section
        inpTmp[windowInputLine] = ""

        for i=1, table.getn(windowInpRead) do
            inpTmp[windowInputLine] = inpTmp[windowInputLine]..windowInpRead[i]
        end

        windowSimpleInputReturns = inpTmp[windowInputLine]

        if hide == true then
            inpTmp[windowInputLine] = "#: "..string.gsub(inpTmp[windowInputLine], ".", "*").."_"
        else
            inpTmp[windowInputLine] = "#: "..inpTmp[windowInputLine].."_"
        end

    end

    return windowSimpleInputReturns

end

function GuiUtil.windowSimple_scroll(inp, _iStart, _iMax, lock, xI, yI)
    local function change_pos(_sel)
        inpTmp[windowInputLine] = "["
        local limit = 19
        local precentage_max = math.floor((_iStart / _iMax) * 100)
        local precentage_bar_limit = math.floor((limit / 100) * precentage_max)

        for i=1, precentage_bar_limit do
            inpTmp[windowInputLine] = inpTmp[windowInputLine].."#"
        end

        for i=1, limit-precentage_bar_limit do
            inpTmp[windowInputLine] = inpTmp[windowInputLine].." "
        end

        inpTmp[windowInputLine] = inpTmp[windowInputLine].."]"
        inpTmp[windowInputLine-1] = "#: ".._iStart
    end

    inpTmp = inp
    for i=1, 5 do
        if i>3 then
            inpTmp[i] = nil
        end
    end

    table.insert(inpTmp, "")
    table.insert(inpTmp, "")
    windowInputLine = table.getn(inpTmp) + 1

    while true do
        change_pos(_iStart)
        windowSimple(inp, xI, yI)
        if lock == true then
            windowEv, windowInputArg = coroutine.yield("key")
        else
            windowEv, windowInputArg = os.pullEvent("key")
        end

        if windowInputArg == 203 and _iStart > 0 then
            _iStart = _iStart - 1
        elseif windowInputArg == 205 and _iStart < _iMax then
            _iStart = _iStart + 1
        elseif windowInputArg == 200 then
            _iStart = _iMax
        elseif windowInputArg == 208 then
            _iStart = 1
        elseif windowInputArg == 28 or windowInputArg == 156 then
            break
        end
    end
    return _iStart
end

function GuiUtil.small_menu(_iPos, _tItems, _iScreenPos, _fPrint, _fCatch, _bLock)
    local function small_menuCatchEvent()
        if _bLock ~= 1 then
            menuListEv, menuListArg = os.pullEvent("key")
        else
            menuListEv, menuListArg = coroutine.yield("key")
        end

        if menuListArg == 200 or menuListArg == 17 then
            if _iPos > 1 then
                _iPos = _iPos - 1
                return _iPos
            else
                _iPos = #_tItems
                return _iPos
            end
        elseif menuListArg == 208 or menuListArg == 31 then
            if _iPos < #_tItems then
                _iPos = _iPos + 1
                return _iPos
            else
                _iPos = 1
                return _iPos
            end
        elseif menuListArg == 28 then
            return true
        elseif menuListArg == 29 then
            return false
        end
        return _iPos
    end

    _fPrint = _fPrint or print
    _iScreenPos = _iScreenPos or 1
    if _iScreenPos > 4 then
        _iScreenPos = 1
    end
    _fCatch = _fCatch or small_menuCatchEvent

    local limit = util.tableLongest(_tItems) + 4
    getResolution()

    local screenPos = {
        [1] = { -- bottom-left
            ox = 1,
            oy = y-#_tItems-1
        },
        [2] = { -- bottom-right
            ox = x - (limit+1),
            oy = y-#_tItems-1
        },
        [3] = { -- top-left
            ox = 1,
            oy = 1
        },
        [4] = { -- top-right
            ox = x - (limit+1),
            oy = 1
        },
    }


    term.setCursorPos(screenPos[_iScreenPos].ox, screenPos[_iScreenPos].oy)
    print("+-"..util.makeLn(limit).."-+")
    term.setCursorPos(screenPos[_iScreenPos].ox, screenPos[_iScreenPos].oy+1)

    for i=1, #_tItems do
        if _iPos == i then
            print("|[".._tItems[i]..util.makeLn(limit - string.len(_tItems[i]), " ").."]|")
        else
            print("| ".._tItems[i]..util.makeLn(limit - string.len(_tItems[i]), " ").." |")
        end

        term.setCursorPos(screenPos[_iScreenPos].ox, screenPos[_iScreenPos].oy+(1 * i)+1)

    end
    print("+-"..util.makeLn(limit).."-+")

    return small_menuCatchEvent()

end

return GuiUtil
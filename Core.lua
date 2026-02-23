local ADDON_NAME, CL = ...
CL.abbv = "CL"


-------------------------------------------------------------------------------
--- Configuration
-------------------------------------------------------------------------------

local addonColor = "00bf40bf"


-------------------------------------------------------------------------------
--- Print Functions
-------------------------------------------------------------------------------

function CL:Print(msg)
    print("|c" .. addonColor .. ADDON_NAME .. ":|r " .. msg)
end

function CL:VPrint(msg)
    if not CL.verbose then return end

    print("|c" .. addonColor .. CL.abbv .. ":|r " .. msg)
end


-------------------------------------------------------------------------------
--- Utility Functions
-------------------------------------------------------------------------------

function CL:DeepCopy(orig)
    local copy = {}
    for k, v in pairs(orig) do
        if type(v) == "table" then
            copy[k] = CL:DeepCopy(v)
        else
            copy[k] = v
        end
    end

    return copy
end

function CL:HexToRGB(hex)
    hex = hex:gsub("#", "") -- Remove # if present
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255

    return r, g, b
end

function CL:GetSortedGroups()
    local sorted = {}
    for key, group in pairs(CL.db.itemGroups) do
        sorted[#sorted + 1] = { key = key, group = group }
    end

    table.sort(sorted, function(a, b)
        return (a.group.order or 0) < (b.group.order or 0)
    end)

    return sorted
end


-------------------------------------------------------------------------------
--- Toggle Functions
-------------------------------------------------------------------------------

function CL:ToggleFullNames()
    CL.fullItemNames = not CL.fullItemNames
    CL:Print("Using " .. (CL.fullItemNames and "Full Names" or "Nicknames"))
    CL:Update(true)
end

function CL:ToggleDebug()
    CL.verbose = not CL.verbose
    CL:Print("debug turned " .. (CL.verbose and "on" or "off"))
    CL:Update(true)
end

local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Configuration Variables
-------------------------------------------------------------------------------

local IMMEDIATELY = true

local     vHeight = 29  -- mutable; updated by CL:ApplyDisplaySettings()
local textOffset = 3
local paddingBottom = -3 -- Adjust all text down

local frameWidth = 300

CL.fullItemNames = false

local AH_MOUNT_SPELL_IDS = {
    465235, -- Trader's Gilded Brutosaur
    264058, -- Mighty Caravan Brutosaur
}


-------------------------------------------------------------------------------
--- Display Functions
-------------------------------------------------------------------------------

function CL:HideItemGroup(groupName)
    CL.frame.itemTexts[groupName].left:Hide()
    CL.frame.itemTexts[groupName].right:Hide()
end

function CL:ShowItemGroup(groupName)
    CL.frame.itemTexts[groupName].left:Show()
    CL.frame.itemTexts[groupName].right:Show()
end

function CL:RebuildDisplay()
    for groupId, texts in pairs(CL.frame.itemTexts) do
        texts.left:Hide()
        texts.right:Hide()
    end

    wipe(CL.frame.itemTexts)
    CL:Update(IMMEDIATELY)
end

local function IsMountedOnAHMount()
    if not IsMounted() then return false end
    if InCombatLockdown() then return false end

    for _, spellID in ipairs(AH_MOUNT_SPELL_IDS) do
        if C_UnitAuras.GetPlayerAuraBySpellID(spellID) then
            return true
        end
    end

    return false
end

function CL:ShowFrame(shouldRunImmediately)
    CL:VPrint("Frame should be Shown")
    CL.frame:Show()
    CL:Update(shouldRunImmediately)
end

function CL:HideFrame(shouldRunImmediately)
    CL:VPrint("Frame should be Hidden")
    CL:Update(shouldRunImmediately)
    CL.frame:Hide()
end

function CL:HideOrShowUpdate(shouldRunImmediately)
    shouldRunImmediately = shouldRunImmediately or false

    local settings = ConsumablesListDB and ConsumablesListDB.settings

    -- Hide if the addon is disabled
    if settings and not settings.enabled then
        CL:VPrint("Frame should be Hidden (disabled)")
        CL.frame:Hide()

        return
    end

    local inInstance, instanceType = IsInInstance()

    local showInNeighborhood  = not settings or settings.showInNeighborhood
    local showOnAHMount       = not settings or settings.showOnAHMount
    local showOutsideOfCities = not settings or settings.showOutsideOfCities

    -- If we are in combat lock down, hide the frame and early return
    if InCombatLockdown() then CL:HideFrame(shouldRunImmediately); return end

    -- Show if we are on an AH mount (with the setting enabled)
    if (showOnAHMount and IsMountedOnAHMount()) then CL:ShowFrame(shouldRunImmediately); return end

    ----------------------------------------------------------------------------
    -- Checking if we should SHOW the frame

    -- Show if we are in a City
    if IsResting()

    -- Show if we are not in a city (with the setting enabled)
    or showOutsideOfCities
    then
        ------------------------------------------------------------------------
        -- Checking if we should override and HIDE the frame

        -- Hide if we are mounted
        if (IsMounted())

        -- Hide if we are instanced unless
        --   1. We are in a neighborhood
        or (inInstance and not
            (showInNeighborhood and instanceType == "neighborhood"))

        -- Hide if we are a ghost
        or UnitIsDead("player")
        then
            CL:HideFrame(shouldRunImmediately)
        else
            CL:ShowFrame(shouldRunImmediately)
        end
    else
        CL:HideFrame(shouldRunImmediately)
    end
end

local updateIsThrottled = false
local minUpdateInterval = 15 -- Minimum time (seconds) between automatic updates

function CL:Update(shouldRunImmediately)
    shouldRunImmediately = shouldRunImmediately or false

    if updateIsThrottled and not shouldRunImmediately then return end

    updateIsThrottled = true
    local index = 0

    for groupId, itemGroup in pairs(CL.db.itemGroups) do
        local    itemId = itemGroup.itemIds[1]

        -- Skip groups with no items
        if not itemId then
            if CL.frame.itemTexts[groupId] then
                CL:HideItemGroup(groupId)
            end
        else

        local  itemName = C_Item.GetItemNameByID(itemId)
        local      r,g,b = CL:HexToRGB(itemGroup.color)
        local itemCount = 0

        -- Prevent LUA error if our item isn't in cache yet, re-try in a second
        if not ((itemGroup and itemGroup.name) or itemName) then
            CL:VPrint("CL: Item not cached, no name found for itemId: " .. itemId)
            C_Timer.After(1, function()
                CL:Update(IMMEDIATELY)
            end)

            return
        end

        for _, id in ipairs(itemGroup.itemIds) do
            itemCount = itemCount + GetItemCount(id, false)
        end

        if not CL.frame.itemTexts[groupId] then
            CL.frame.itemTexts[groupId] = {}

            -- Create the text for the item name on the right
            CL.frame.itemTexts[groupId].right = CL.frame:CreateFontString(nil, "OVERLAY")
            CL.frame.itemTexts[groupId].right:SetFontObject(CL.frame.font)
            CL.frame.itemTexts[groupId].right:SetTextColor(r, g, b, 1)

            -- Create the text for the item count on the left
            CL.frame.itemTexts[groupId].left = CL.frame:CreateFontString(nil, "OVERLAY")
            CL.frame.itemTexts[groupId].left:SetFontObject(CL.frame.font)
            CL.frame.itemTexts[groupId].left:SetTextColor(r, g, b, 1)
        end

        local      itemNameText = ((itemGroup and itemGroup.name) or itemName)
        local fullItemNameText = itemName
        local     itemCountText = itemCount

        -- Update text for low vs out of an item
        if itemCount == 0 then
            itemNameText = ("Out of " ..  itemNameText)
        else
            itemNameText = (itemNameText .. " Low")
        end

        -- Check if `/cl f` was run and replace with full text value if so
        itemNameText = (CL.fullItemNames and fullItemNameText) or itemNameText

        CL.frame.itemTexts[groupId].right:SetText(itemNameText)
        CL.frame.itemTexts[groupId].left:SetText(itemCountText)

        -- Show if there are less than the threshold of items
        if itemCount < itemGroup.threshold then
            index = index + 1
            CL:ShowItemGroup(groupId)
        else
            CL:HideItemGroup(groupId)
        end

        end -- else (has itemId)
    end

    -- Resize frame height to fit visible rows, width is fixed
    local rowHeight = vHeight
    local frameHeight = math.max(rowHeight, index * rowHeight)

    -- Reposition text rows in sorted order (top-down, so first group appears at top)
    local rowIndex = index - 1
    for _, entry in ipairs(CL:GetSortedGroups()) do
        local texts = CL.frame.itemTexts[entry.key]
        if texts and texts.left:IsShown() then
            local yOffset = (rowIndex * rowHeight) + paddingBottom
            texts.right:ClearAllPoints()
            texts.right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMLEFT", textOffset, yOffset)

            texts.left:ClearAllPoints()
            texts.left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMLEFT", -textOffset, yOffset)

            rowIndex = rowIndex - 1
        end
    end

    CL.frame:SetHeight(frameHeight)

    C_Timer.After(minUpdateInterval, function()
        updateIsThrottled = false
    end)
end


-------------------------------------------------------------------------------
--- Frame Initialization
-------------------------------------------------------------------------------

-- Create the main frame
CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
CL.frame:SetSize(frameWidth, 1)
CL.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 20, 200)
CL.frame:SetMovable(true)
CL.frame:SetClampedToScreen(true)
CL.frame:Hide()

-- LibEditMode integration
local LibEditMode = LibStub("LibEditMode")

local function OnPositionChanged(frame, layoutName, point, x, y)
    if not ConsumablesListDB then return end
    if not ConsumablesListDB.positions then
        ConsumablesListDB.positions = {}
    end

    ConsumablesListDB.positions[layoutName] = { point = point, x = x, y = y }
end

local function OnLayoutChanged(layoutName)
    if not ConsumablesListDB or not ConsumablesListDB.positions then return end

    local pos = ConsumablesListDB.positions[layoutName]
    if pos then
        CL.frame:ClearAllPoints()
        CL.frame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    end
end

LibEditMode:AddFrame(CL.frame, OnPositionChanged, { point = "BOTTOMLEFT", x = 20, y = 200 }, "Consumables List")
LibEditMode:RegisterCallback("layout", OnLayoutChanged)

-- Set up custom font
local FONT = "Interface\\AddOns\\ConsumablesList\\media\\fonts\\PTSansNarrow-Bold.ttf"

CL.frame.font = CreateFont("ConsumablesListFont")
CL.frame.font:SetFont(FONT, 30, "OUTLINE")
CL.frame.font:SetTextColor(1, 1, 1, 1)

-- Container for text items
CL.frame.itemTexts = {}

function CL:ApplyDisplaySettings()
    local settings = ConsumablesListDB.settings
    local LSM = LibStub("LibSharedMedia-3.0")
    local fontPath = LSM:Fetch("font", settings.fontName) or FONT
    CL.frame.font:SetFont(fontPath, settings.fontSize, "OUTLINE")
    vHeight = settings.lineHeight
    CL:RebuildDisplay()
end


-------------------------------------------------------------------------------
--- Event Handling
-------------------------------------------------------------------------------

local function EventHandler(self, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 == ADDON_NAME then
            if not ConsumablesListDB then
                ConsumablesListDB = {}
            end

            -- Initialize itemGroups from saved data or defaults
            if ConsumablesListDB.itemGroups then
                CL.db.itemGroups = ConsumablesListDB.itemGroups
            else
                CL.db.itemGroups = CopyTable(CL.db.defaults)
                ConsumablesListDB.itemGroups = CL.db.itemGroups
            end

            -- Backfill order for any groups that predate the order field
            local nextOrder = 1
            for _, group in pairs(CL.db.itemGroups) do
                if not group.order then
                    group.order = nextOrder
                    nextOrder = nextOrder + 1
                end
            end

            -- Initialize settings from saved data, backfilling any missing keys from defaults
            if not ConsumablesListDB.settings then
                ConsumablesListDB.settings = {}
            end

            for key, defaultValue in pairs(CL.db.settingsDefaults) do
                if ConsumablesListDB.settings[key] == nil then
                    ConsumablesListDB.settings[key] = defaultValue
                end
            end

            -- Sync runtime state from settings
            CL.fullItemNames = ConsumablesListDB.settings.useFullNames
            CL:ApplyDisplaySettings()
            CL:RegisterSettings()

            CL.frame:UnregisterEvent("ADDON_LOADED")

            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone
            CL.frame:RegisterEvent("MERCHANT_SHOW")         -- Restocking at vendors

            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Combat Enter
            CL.frame:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Combat Exit

            CL.frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED") -- Mounting

            CL.frame:RegisterEvent("PLAYER_UPDATE_RESTING") -- Entering a City
            CL.frame:RegisterEvent("ZONE_CHANGED_NEW_AREA") -- Area Change

            CL:Print("Loaded. Use " .. SLASH_CONSUMABLESLIST1 .. " for commands.")
        end
    else
        -- Skip all processing when addon is disabled
        local settings = ConsumablesListDB and ConsumablesListDB.settings
        if settings and not settings.enabled then
            CL.frame:Hide()

            return
        end

        if event == "PLAYER_REGEN_DISABLED" then
            CL:VPrint("Hiding for combat enter: " .. event)
            CL.frame:Hide()
        elseif event == "PLAYER_REGEN_ENABLED" or           -- Exiting Combat
               event == "PLAYER_UPDATE_RESTING" or          -- Entering City
               event == "PLAYER_MOUNT_DISPLAY_CHANGED" then -- Mounting
            CL:VPrint("Update IMMEDIATELY for: " .. event)
            CL:HideOrShowUpdate(IMMEDIATELY)
        elseif event == "BAG_UPDATE" or                     -- Inventory changes
               event == "ITEM_PUSH" then                    -- Immediate loot feedback
            CL:VPrint("Update IMMEDIATELY for: " .. event)
            CL:HideOrShowUpdate(IMMEDIATELY)
        else
            CL:VPrint("Update LAZILY for: " .. event)
            CL:HideOrShowUpdate()
        end
    end
end

-- Register events
CL.frame:RegisterEvent("ADDON_LOADED")

CL.frame:SetScript("OnEvent", EventHandler)

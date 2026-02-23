local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Configuration Variables
-------------------------------------------------------------------------------

local IMMEDIATELY = true

local    fontSize = 30
local     vHeight = 29
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

function CL:HideOrShowUpdate(shouldRunImmediately)
    shouldRunImmediately = shouldRunImmediately or false

    local inInstance, instanceType = IsInInstance()

    ---------------------------------------
    -- Checking if we should HIDE the frame

    -- Hide if we are in combat lockdown
    if InCombatLockdown()

    -- Hide if we are instanced unless
    --   1. We are mounted on an AH Mount
    --   2. We are in a neighborhood
    or (inInstance and not (IsMountedOnAHMount() or
                            instanceType == "neighborhood"))

    -- Hide if we are mounted unless
    --   1. We are in a city or
    --   2. We are mounted on an AH Mount
    or (IsMounted() and not (IsResting() or
                             IsMountedOnAHMount()))

    -- Hide if we are dead
    or UnitIsDead("player")
    then
        CL:VPrint("Frame should be Hidden")
        CL:Update(shouldRunImmediately)
        CL.frame:Hide()
    else
        CL:VPrint("Frame should be Shown")
        CL.frame:Show()
        CL:Update(shouldRunImmediately)
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
CL.frame.font:SetFont(FONT, fontSize, "OUTLINE")
CL.frame.font:SetTextColor(1, 1, 1, 1)

-- Container for text items
CL.frame.itemTexts = {}


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
                CL.db.itemGroups = CL:DeepCopy(CL.db.defaults)
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
    elseif event == "PLAYER_REGEN_DISABLED" then
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

-- Register events
CL.frame:RegisterEvent("ADDON_LOADED")

CL.frame:SetScript("OnEvent", EventHandler)

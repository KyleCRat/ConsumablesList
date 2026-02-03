local ADDON_NAME, CL = ...
CL.abbv = "CL"


-------------------------------------------------------------------------------
--- Configuration Variables
-------------------------------------------------------------------------------

local IMMEDIATELY = true

local addon_color = "00bf40bf"

local      font_size = 30
local       v_height = 28
local  handle_offset = 32 -- Adjust Handle to the left
local     mover_size = 32
local padding_bottom = -3 -- Adjust all text down

local full_item_names = false

local AH_MOUNT_SPELL_IDS = {
    465235, -- Trader's Gilded Brutosaur
    264058, -- Mighty Caravan Brutosaur
}

-------------------------------------------------------------------------------
--- Functions
-------------------------------------------------------------------------------

function CL:Print(msg)
    print("|c" .. addon_color .. ADDON_NAME .. ":|r " .. msg)
end

function CL:VPrint(msg)
    if not verbose then return end

    print("|c" .. addon_color .. CL.abbv .. ":|r " .. msg)
end

local function hex_to_rgb(hex)
    hex = hex:gsub("#", "") -- Remove # if present
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255
    return r, g, b
end

function CL:HideItemGroup(group_name)
    CL.frame.item_texts[group_name].left:Hide()
    CL.frame.item_texts[group_name].right:Hide()
end

function CL:ShowItemGroup(group_name)
    CL.frame.item_texts[group_name].left:Show()
    CL.frame.item_texts[group_name].right:Show()
end

function CL:ToggleLock()
    ConsumablesListDB.locked = not ConsumablesListDB.locked
    CL:Lock(ConsumablesListDB.locked)
    CL:Print("Frame " .. (ConsumablesListDB.locked and "L" or "Unl") .. "ocked")
end

function CL:Lock(locked)
    if locked then
        CL.frame.bg:Hide()
        CL.frame.handle:Hide()
        CL.frame:EnableMouse(false)
    else
        CL.frame.bg:Show()
        CL.frame.handle:Show()
        CL.frame:EnableMouse(true)
    end
end

function CL:ToggleFullNames()
    full_item_names = not full_item_names
    CL:Print("Using " .. (full_item_names and "Full Names" or "Nicknames"))
    CL:Update(IMMEDIATELY)
end

function CL:ToggleDebug()
    verbose = not verbose
    CL:Print("debug turned " .. (verbose and "on" or "off"))
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

function CL:HideOrShowUpdate(should_run_immediately)
    should_run_immediately = should_run_immediately or false

    inInstance, instanceType = IsInInstance()

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
        CL.frame:Hide()
    else
        CL:VPrint("Frame should be Shown")
        CL.frame:Show()
        CL:Update(should_run_immediately)
    end
end

local update_is_throttled = false
local min_update_interval = 15 -- Minimum time (seconds) between automatic updates

function CL:Update(should_run_immediately)
    should_run_immediately = should_run_immediately or false

    if update_is_throttled and not should_run_immediately then return end

    update_is_throttled = true
    local index = 0

    for group_id, item_group in pairs(CL.db.item_groups) do
        local    item_id = item_group.item_ids[1]
        local  item_name = C_Item.GetItemNameByID(item_id)
        local      r,g,b = hex_to_rgb(item_group.color)
        local item_count = 0

        -- Prevent LUA error if our item isn't in cache yet, re-try in a second
        if not ((item_group and item_group.name) or item_name) then
            CL.VPrint("CL: Item not cached, no name found for item_id: " .. item_id)
            C_Timer.After(1, function()
                CL:Update(IMMEDIATELY)
            end)

            return
        end

        for _, id in ipairs(item_group.item_ids) do
            item_count = item_count + GetItemCount(id, false)
        end

        if not CL.frame.item_texts[group_id] then
            CL.frame.item_texts[group_id] = {}

            -- Create the text for the item name on the right
            CL.frame.item_texts[group_id].right = CL.frame:CreateFontString(nil, "OVERLAY")
            CL.frame.item_texts[group_id].right:SetFontObject(CL.frame.font)
            CL.frame.item_texts[group_id].right:SetTextColor(r, g, b, 1)

            -- Create the text for the item count on the left
            CL.frame.item_texts[group_id].left = CL.frame:CreateFontString(nil, "OVERLAY")
            CL.frame.item_texts[group_id].left:SetFontObject(CL.frame.font)
            CL.frame.item_texts[group_id].left:SetTextColor(r, g, b, 1)
        end

        local y_offset = (index * (font_size + v_height - font_size)) + padding_bottom

        local      item_name_text = ((item_group and item_group.name) or item_name)
        local full_item_name_text = item_name
        local     item_count_text = item_count

        -- CL:VPrint(item_name .. ":" .. item_count)

        -- Update text for low vs out of an item
        if item_count == 0 then
            item_name_text = ("Out of " ..  item_name_text)
        else
            item_name_text = (item_name_text .. " Low")
        end

        -- Check if `/cl f` was run and replace with full text value if so
        item_name_text = (full_item_names and full_item_name_text) or item_name_text

        CL.frame.item_texts[group_id].right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMRIGHT", handle_offset + 2, y_offset)
        CL.frame.item_texts[group_id].right:SetText(item_name_text)

        CL.frame.item_texts[group_id].left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMRIGHT", handle_offset + -2, y_offset)
        CL.frame.item_texts[group_id].left:SetText(item_count_text)

        -- Show if there are less than the threshold of items
        if item_count < item_group.threshold then
            index = index + 1
            CL:ShowItemGroup(group_id)
        else
            CL:HideItemGroup(group_id)
        end
    end

    C_Timer.After(min_update_interval, function()
        update_is_throttled = false
    end)
end


-------------------------------------------------------------------------------
--- Initialization
-------------------------------------------------------------------------------

-- Create the main frame
CL.frame = CreateFrame("Frame", "ConsumablesListFrame", UIParent)
CL.frame:SetSize(mover_size, mover_size)
CL.frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
CL.frame:SetMovable(true)
CL.frame:SetClampedToScreen(true)
CL.frame:Hide()

-- Create background
CL.frame.bg = CL.frame:CreateTexture(nil, "BACKGROUND")
CL.frame.bg:SetAllPoints(CL.frame)
CL.frame.bg:SetColorTexture(0, 0, 0, 0.5)

-- Create mover texture
CL.frame.handle = CL.frame:CreateTexture(nil, "BACKGROUND")
CL.frame.handle:SetSize(mover_size - 2, mover_size - 2)
CL.frame.handle:SetPoint("CENTER", CL.frame, "CENTER", 0, 0)
CL.frame.handle:SetTexture("Interface\\CURSOR\\UI-Cursor-Move")
CL.frame.handle:SetVertexColor(1, 1, 1, 1)

-- Make the frame draggable
CL.frame:EnableMouse(true)
CL.frame:RegisterForDrag("LeftButton")
CL.frame:SetScript("OnDragStart", CL.frame.StartMoving)
CL.frame:SetScript("OnDragStop", CL.frame.StopMovingOrSizing)

-- Set up custom font (using a WoW built-in font, or replace with your own font file)
local FONT = "Interface\\AddOns\\ConsumablesList\\media\\fonts\\PTSansNarrow-Bold.ttf"

CL.frame.font = CreateFont("ConsumablesListFont")
CL.frame.font:SetFont(FONT, font_size, "OUTLINE")
CL.frame.font:SetTextColor(1, 1, 1, 1)

-- Container for text items
CL.frame.item_texts = {}


-------------------------------------------------------------------------------
--- Event Handling
-------------------------------------------------------------------------------

local function EventHandler(self, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 == ADDON_NAME then
            if not ConsumablesListDB then
                CL:Print("ConsumablesListDB not available")
                ConsumablesListDB = {
                    locked = false
                }
            else
                -- Set saved variables
                CL:Lock(ConsumablesListDB.locked)
            end

            CL.frame:UnregisterEvent("ADDON_LOADED")

            CL.frame:RegisterEvent("BAG_UPDATE")            -- Main inventory changes
            CL.frame:RegisterEvent("ITEM_PUSH")             -- Immediate loot feedback
            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Initial load/zone
            CL.frame:RegisterEvent("MERCHANT_SHOW")         -- Restocking at vendors

            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED") -- Combat Enter
            CL.frame:RegisterEvent("PLAYER_REGEN_ENABLED")  -- Combat Exit

            CL.frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED") -- Mounting

            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Login
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
    else
        CL:VPrint("Update LAZILY for: " .. event)
        CL:HideOrShowUpdate()
    end
end

-- Register events
CL.frame:RegisterEvent("ADDON_LOADED")

CL.frame:SetScript("OnEvent", EventHandler)

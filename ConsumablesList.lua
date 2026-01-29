ADDON_NAME, CL = ...

-------------------------------------------------------------------------------
--- Configuration Variables
-------------------------------------------------------------------------------

local IMMEDIATELY = true

local addon_color = "c00bf40bf"

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
    print("|" .. addon_color .. ADDON_NAME .. ":|r " .. msg)
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

function CL:HideOrShowUpdate(immediately)
    immediately = immediately or false

    ---------------------------------------
    -- Checking if we should HIDE the frame

    -- Hide if we are in combat lockdown
    if InCombatLockdown()

    -- Hide if we are mounted unless
    --   1. We are in a city or
    --   2. We are mounted on an AH Mount
    or (IsMounted() and not (IsResting() or IsMountedOnAHMount()))

    -- Hide if we are instanced unless
    --   1. We are mounted on an AH Mount
    or (IsInInstance() and not IsMountedOnAHMount())

    -- Hide if we are dead
    or UnitIsDead("player")
    then
        CL.frame:Hide()
    else
        -- verbose and print("CL: Decided to show! Immediate: " .. (immediately and "true" or "false"))
        CL.frame:Show()
        CL:Update(immediately)
    end
end

local throttle_update = false

function CL:Update(immediately)
    immediately = immediately or false

    if throttle_update and not immediately then return end
    throttle_update = true

    C_Timer.After(1, function()
        local index = 0

        for group_id, item_group in pairs(CL.db.item_groups) do
            local    item_id = item_group.item_ids[1]
            local  item_name = C_Item.GetItemNameByID(item_id)
            local      r,g,b = hex_to_rgb(item_group.color)
            local item_count = 0

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

        throttle_update = false
    end)
end

function CL:EventHandler(event, addon)
    if event == "ADDON_LOADED" then
        if addon == ADDON_NAME then
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

            CL.frame:RegisterEvent("BAG_UPDATE")
            CL.frame:RegisterEvent("BAG_UPDATE_COOLDOWN")
            CL.frame:RegisterEvent("ITEM_PUSH")
            CL.frame:RegisterEvent("UNIT_INVENTORY_CHANGED")
            CL.frame:RegisterEvent("ITEM_LOCK_CHANGED")
            CL.frame:RegisterEvent("PLAYER_LOGOUT")
            CL.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
            CL.frame:RegisterEvent("MERCHANT_SHOW")
            CL.frame:RegisterEvent("BANKFRAME_OPENED")
            CL.frame:RegisterEvent("GUILDBANKFRAME_OPENED")
            CL.frame:RegisterEvent("PLAYER_REGEN_DISABLED")
            CL.frame:RegisterEvent("PLAYER_REGEN_ENABLED")
            CL.frame:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
            CL.frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

            CL:Print("Loaded. Use " .. SLASH_CONSUMABLELIST1 .. " for commands.")
        end
    elseif event == "PLAYER_REGEN_DISABLED" then
        CL.frame:Hide()
    elseif event == "PLAYER_REGEN_ENABLED" or           -- Entering Combat
           event == "PLAYER_UPDATE_RESTING" or          -- Entering City
           event == "PLAYER_MOUNT_DISPLAY_CHANGED" then -- Mounting
        CL:HideOrShowUpdate(IMMEDIATELY)
    else
        CL:HideOrShowUpdate()
    end
end


-------------------------------------------------------------------------------
--- Initialization
-------------------------------------------------------------------------------

-- Create the main frame
CL.frame = CreateFrame("Frame", "ConsumeablesListFrame", UIParent)
CL.frame:SetSize(mover_size, mover_size)
CL.frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
CL.frame:SetMovable(true)
CL.frame:SetClampedToScreen(true)

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
local FONT = "Interface\\AddOns\\EvenOddGroup\\media\\fonts\\PTSansNarrow-Bold.ttf"

CL.frame.font = CreateFont("ConsumablesListFont")
CL.frame.font:SetFont(FONT, font_size, "OUTLINE")
CL.frame.font:SetTextColor(1, 1, 1, 1)

-- Container for text items
CL.frame.item_texts = {}

-------------------------------------------------------------------------------
--- Event Handling
-------------------------------------------------------------------------------

CL.frame:SetScript("OnEvent", function(self, event, addon)
    CL:EventHandler(event, addon)
end)

-- Register events
CL.frame:RegisterEvent("ADDON_LOADED")


-------------------------------------------------------------------------------
--- Slash Commands
-------------------------------------------------------------------------------

CL.cmds = {}

CL.cmds.toggle_lock = {
    triggers = { 'lock', 'l' },
    name = "Lock",
    description = "Lock or Unlock the Frame.",
    func = function()
        ConsumablesListDB.locked = not ConsumablesListDB.locked
        CL:Lock(ConsumablesListDB.locked)
        CL:Print("Frame " .. (ConsumablesListDB.locked and "L" or "Unl") .. "ocked")
    end,
}

CL.cmds.toggle_names = {
    triggers = { 'full', 'f' },
    name = "Full Names",
    description = "Toggle between full item names and nicknames.",
    func = function()
        full_item_names = not full_item_names
        CL:Update(IMMEDIATELY)
        CL:Print("Using " .. (full_item_names and "Full Names" or "Nicknames"))
    end,
}

function CL:Help()
    CL:Print("Available Commands:")
    for _, cmd in pairs(CL.cmds) do
        for _, trigger in ipairs(cmd.triggers) do
            print("  /cl " .. trigger .. " - " .. cmd.description)
        end
    end
end

SLASH_CONSUMABLELIST1 = "/cl"

SlashCmdList["CONSUMABLELIST"] = function(msg)
    msg = msg:lower():trim()

    -- Check if message is a defined command
    for _, cmd in pairs(CL.cmds) do
        for _, trigger in ipairs(cmd.triggers) do
            if trigger == msg then
                cmd.func()
                return
            end
        end
    end

    -- Otherwise print help
    CL:Help()
end

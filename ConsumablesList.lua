ADDON_NAME, CL = ...

_G.CL = CL

-------------------------------------------------------------------------------
--- Configuration Variables
---
local font_size = 32
local v_height = 26
local padding_bottom = 0

-------------------------------------------------------------------------------
--- Functions
---
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
        CL.frame:EnableMouse(false)
    else
        CL.frame.bg:Show()
        CL.frame:EnableMouse(true)
    end
end

local throttle_update = false
function CL:Update()
    if throttle_update then return end
    throttle_update = true

    C_Timer.After(1, function()
        local index = 0

        for group_id, item_group in pairs(CL.db.item_groups) do
            local item_name = C_Item.GetItemNameByID(item_group.item_ids[1])
            local item_name_text = ((item_group and item_group.name) or item_name) .. " Remaining"
            local r,g,b = hex_to_rgb(item_group.color)
            local item_count = 0

            for _, item_id in ipairs(item_group.item_ids) do
                item_count = item_count + GetItemCount(item_id, false)
            end

            if not CL.frame.item_texts[group_id] then
                CL.frame.item_texts[group_id] = {}

                -- Create the text for the item name on the right
                CL.frame.item_texts[group_id].right = CL.frame:CreateFontString(nil, "OVERLAY")
                CL.frame.item_texts[group_id].right:SetFontObject(CL.frame.font)
                CL.frame.item_texts[group_id].right:SetTextColor(r, g, b, 1)
                CL.frame.item_texts[group_id].right:SetText(item_name_text)

                -- Create the text for the item count on the left
                CL.frame.item_texts[group_id].left = CL.frame:CreateFontString(nil, "OVERLAY")
                CL.frame.item_texts[group_id].left:SetFontObject(CL.frame.font)
                CL.frame.item_texts[group_id].left:SetTextColor(r, g, b, 1)
            end

            CL.frame.item_texts[group_id].right:SetPoint("BOTTOMLEFT", CL.frame, "BOTTOMRIGHT", 2, (index * v_height) + padding_bottom)
            CL.frame.item_texts[group_id].right:SetText(item_name_text)

            CL.frame.item_texts[group_id].left:SetPoint("BOTTOMRIGHT", CL.frame, "BOTTOMRIGHT", -2, (index * v_height) + padding_bottom)
            CL.frame.item_texts[group_id].left:SetText(item_count)

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

-------------------------------------------------------------------------------
--- Initialization
---

-- Create the main frame
CL.frame = CreateFrame("Frame", "ConsumeablesListFrame", UIParent)
CL.frame:SetSize(48, v_height)
CL.frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
CL.frame:SetMovable(true)
CL.frame:SetClampedToScreen(true)

-- Make the frame draggable
CL.frame:EnableMouse(true)
CL.frame:RegisterForDrag("LeftButton")
CL.frame:SetScript("OnDragStart", CL.frame.StartMoving)
CL.frame:SetScript("OnDragStop", CL.frame.StopMovingOrSizing)

-- Create background
CL.frame.bg = CL.frame:CreateTexture(nil, "BACKGROUND")
CL.frame.bg:SetAllPoints(CL.frame)
CL.frame.bg:SetColorTexture(0, 0, 0, 0.5)

-- Set up custom font (using a WoW built-in font, or replace with your own font file)
local FONT = "Interface\\AddOns\\EvenOddGroup\\media\\fonts\\PTSansNarrow-Bold.ttf"

CL.frame.font = CreateFont("EvenOddGroupFont")
CL.frame.font:SetFont(FONT, font_size, "OUTLINE")
CL.frame.font:SetTextColor(1, 1, 1, 1)

-- Container for text items
CL.frame.item_texts = {}

-------------------------------------------------------------------------------
--- Event Handling
---
CL.frame:SetScript("OnEvent", function(self, event, addon)
    if event == "ADDON_LOADED" then
        if addon == ADDON_NAME then
            if not ConsumablesListDB then
                print("ConsumablesListDB not available")
                ConsumablesListDB = {
                    locked = false
                }
            else
                -- Set saved variables
                CL:Lock(ConsumablesListDB.locked)
            end

            self:UnregisterEvent("ADDON_LOADED")

            self:RegisterEvent("BAG_UPDATE")
            -- self:RegisterEvent("BAG_UPDATE_COOLDOWN")
            self:RegisterEvent("ITEM_PUSH")
            self:RegisterEvent("UNIT_INVENTORY_CHANGED")
            self:RegisterEvent("ITEM_LOCK_CHANGED")
            self:RegisterEvent("PLAYER_LOGOUT")
            self:RegisterEvent("PLAYER_ENTERING_WORLD")
            self:RegisterEvent("MERCHANT_SHOW")
            self:RegisterEvent("BANKFRAME_OPENED")
            self:RegisterEvent("GUILDBANKFRAME_OPENED")
            self:RegisterEvent("PLAYER_REGEN_DISABLED")
            self:RegisterEvent("PLAYER_REGEN_ENABLED")
        end
    elseif event == "PLAYER_REGEN_DISABLED" then
        CL.frame:Hide()
    elseif event == "PLAYER_REGEN_ENABLED" then
        CL:Update()
        CL.frame:Show()
    else
        if not InCombatLockdown() then
            CL:Update()
            CL.frame:Show()
        end
    end
end)

-- Register events
CL.frame:RegisterEvent("ADDON_LOADED")

-------------------------------------------------------------------------------
--- Slash Commands
---
SLASH_CONSUMABLELIST1 = "/cl"

SlashCmdList["CONSUMABLELIST"] = function(msg)
    msg = msg:lower():trim()

    if msg == "l" or msg == "lock" then
        ConsumablesListDB.locked = not ConsumablesListDB.locked
        CL:Lock(ConsumablesListDB.locked)
        print("Consumeables List: Frame " .. (ConsumablesListDB.locked and "L" or "Unl") .. "ocked")
    end
end

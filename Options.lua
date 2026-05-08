local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Options Panel
-------------------------------------------------------------------------------

local PANEL_WIDTH = 860
local PANEL_HEIGHT = 540
local INSET_PADDING = 14

local GROUP_LIST_WIDTH = 220
local BAG_PANEL_HEIGHT = 160
local ICON_SIZE = 34
local ICON_PADDING = 4
local GROUP_BUTTON_HEIGHT = 26
local TRASH_ICON_SIZE = 18
local DRAG_HANDLE_WIDTH = 14

local selectedGroupKey = nil
local groupButtons = {}
local itemRows = {}
local bagButtons = {}
local bagFilterButtons = {}

local dragState = {
    active = false,
    sourceKey = nil,
    ghost = nil,
}

-- Item class filters: classID -> { name, icon }
local ITEM_CLASS_FILTERS = {
    { classID = 0,  name = "Consumable",         icon = 134830 },  -- INV_Potion_93 (red potion)
    { classID = 7,  name = "Tradeskill",         icon = 132996 },  -- Trade_Engineering
    { classID = 8,  name = "Item Enhancement",   icon = 135225 },  -- Spell_Holy_GreaterHeal (enchant scroll)
    { classID = 2,  name = "Weapon",             icon = 135274 },  -- INV_Sword_04
    { classID = 4,  name = "Armor",              icon = 132633 },  -- INV_Chest_Chain
    { classID = 3,  name = "Gem",                icon = 134071 },  -- INV_Misc_Gem_02
    { classID = 5,  name = "Reagent",            icon = 132599 },  -- INV_Misc_Dust_02
    { classID = 15, name = "Miscellaneous",      icon = 134414 },  -- INV_Misc_Bag_10
    { classID = 9,  name = "Recipe",             icon = 134939 },  -- INV_Scroll_06
    { classID = 1,  name = "Container",          icon = 133633 },  -- INV_Misc_Bag_08
    { classID = 12, name = "Quest",              icon = 132049 },  -- INV_Misc_Map02
}

local activeBagFilters = { [0] = true }  -- Default: Consumables only

-------------------------------------------------------------------------------
--- Delete Confirmation Dialog
-------------------------------------------------------------------------------

StaticPopupDialogs["CONSUMABLESLIST_DELETE_GROUP"] = {
    text = "Are you sure you want to delete \"%s\"?",
    button1 = "Delete",
    button2 = "Cancel",
    OnAccept = function(self, groupKey)
        CL.db.itemGroups[groupKey] = nil

        if selectedGroupKey == groupKey then
            selectedGroupKey = nil
        end

        CL:RefreshGroupList()
        CL:RefreshOptionsEditor()
        CL:RebuildDisplay()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

StaticPopupDialogs["CONSUMABLESLIST_REMOVE_ITEM"] = {
    text = "Remove %s from group \"%s\"?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function(self, data)
        local group = CL.db.itemGroups[data.groupKey]
        if not group then return end

        for i, id in ipairs(group.itemIds) do
            if id == data.itemId then
                table.remove(group.itemIds, i)
                break
            end
        end

        CL:RefreshOptionsEditor()
        CL:RefreshBagPanel()
        CL:RebuildDisplay()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

-------------------------------------------------------------------------------
--- Utility
-------------------------------------------------------------------------------

local function getGroupDisplayName(group)
    if group.name and group.name ~= "" then
        return group.name
    end

    if group.itemIds and group.itemIds[1] then
        local name = C_Item.GetItemNameByID(group.itemIds[1])
        if name then
            return name
        end
    end

    return "Unnamed Group"
end

local function generateGroupKey()
    local key = "group_" .. time() .. "_" .. math.random(1000, 9999)

    return key
end

local function getNextOrder()
    local maxOrder = 0
    for _, group in pairs(CL.db.itemGroups) do
        if (group.order or 0) > maxOrder then
            maxOrder = group.order
        end
    end

    return maxOrder + 1
end

local function deleteGroup(key)
    local group = CL.db.itemGroups[key]
    if not group then return end

    local name = getGroupDisplayName(group)
    local popup = StaticPopup_Show("CONSUMABLESLIST_DELETE_GROUP", name)
    if popup then
        popup.data = key
    end
end

-------------------------------------------------------------------------------
--- Group List (Left Panel)
-------------------------------------------------------------------------------

local function clearGroupButtons(scrollChild)
    for _, btn in ipairs(groupButtons) do
        btn:Hide()
        btn:SetParent(nil)
    end

    wipe(groupButtons)
end

local function selectGroup(key)
    selectedGroupKey = key
    CL:RefreshOptionsEditor()
    CL:RefreshGroupList()
    CL:RefreshBagPanel()
end

local function getOrCreateDragGhost()
    if dragState.ghost then
        return dragState.ghost
    end

    local ghost = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    ghost:SetSize(GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT)
    ghost:SetFrameStrata("TOOLTIP")
    ghost:SetBackdrop(CL.UI.BACKDROP)
    ghost:SetBackdropColor(0.2, 0.18, 0.1, 0.9)
    ghost:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    ghost:Hide()

    ghost.text = ghost:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    ghost.text:SetPoint("LEFT", ghost, "LEFT", 6, 0)
    ghost.text:SetPoint("RIGHT", ghost, "RIGHT", -6, 0)
    ghost.text:SetWordWrap(false)
    ghost.text:SetTextColor(unpack(CL.UI.GOLD))

    ghost:SetScript("OnUpdate", function(self)
        local x, y = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale()
        self:ClearAllPoints()
        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale - 8, y / scale + GROUP_BUTTON_HEIGHT / 2)

        -- Highlight the row under the cursor
        local cx, cy = x / scale, y / scale
        for _, btnRow in ipairs(groupButtons) do
            if btnRow:IsShown() and btnRow:GetBottom() then
                local isTarget = btnRow._groupKey ~= dragState.sourceKey
                    and cx >= btnRow:GetLeft() and cx <= btnRow:GetRight()
                    and cy >= btnRow:GetBottom() and cy <= btnRow:GetTop()

                if isTarget then
                    btnRow._dropHighlight:Show()
                else
                    btnRow._dropHighlight:Hide()
                end
            end
        end
    end)

    dragState.ghost = ghost

    return ghost
end

local function reorderGroups(sourceKey, targetKey)
    local sourceOrder = CL.db.itemGroups[sourceKey].order
    local targetOrder = CL.db.itemGroups[targetKey].order

    if sourceOrder == targetOrder then return end

    if sourceOrder < targetOrder then
        -- Moving down: shift items between source+1 and target up by 1
        for _, group in pairs(CL.db.itemGroups) do
            if group.order > sourceOrder and group.order <= targetOrder then
                group.order = group.order - 1
            end
        end
    else
        -- Moving up: shift items between target and source-1 down by 1
        for _, group in pairs(CL.db.itemGroups) do
            if group.order >= targetOrder and group.order < sourceOrder then
                group.order = group.order + 1
            end
        end
    end

    CL.db.itemGroups[sourceKey].order = targetOrder
end

local function findDropTargetKey()
    local scale = UIParent:GetEffectiveScale()
    local cx, cy = GetCursorPosition()
    cx, cy = cx / scale, cy / scale

    for _, btnRow in ipairs(groupButtons) do
        if btnRow:IsShown() and btnRow:GetBottom() then
            local left = btnRow:GetLeft()
            local right = btnRow:GetRight()
            local bottom = btnRow:GetBottom()
            local top = btnRow:GetTop()

            if cx >= left and cx <= right and cy >= bottom and cy <= top then
                return btnRow._groupKey
            end
        end
    end

    return nil
end

local function finishDrag(droppedOnTarget)
    if not dragState.active then return end

    if droppedOnTarget then
        local targetKey = findDropTargetKey()

        if targetKey and targetKey ~= dragState.sourceKey then
            reorderGroups(dragState.sourceKey, targetKey)
        end
    end

    -- Clear all drop highlights before refreshing
    for _, btnRow in ipairs(groupButtons) do
        if btnRow._dropHighlight then
            btnRow._dropHighlight:Hide()
        end
    end

    dragState.active = false
    dragState.sourceKey = nil
    dragState.ghost:Hide()
    CL:RefreshGroupList()
    CL:RebuildDisplay()
end

local function createGroupButton(parent, index, key, group)
    -- Row frame holding drag handle, group button, and trash icon
    local row = CreateFrame("Frame", nil, parent)
    local rowWidth = parent:GetWidth()
    row:SetSize(rowWidth, GROUP_BUTTON_HEIGHT)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))
    row._groupKey = key

    -- Drop highlight (shown when dragging over this row)
    local dropHighlight = row:CreateTexture(nil, "BACKGROUND")
    dropHighlight:SetAllPoints()
    dropHighlight:SetColorTexture(1, 0.82, 0, 0.2)
    dropHighlight:Hide()
    row._dropHighlight = dropHighlight

    -- Drag handle on the left
    local handle = CreateFrame("Button", nil, row)
    handle:SetSize(DRAG_HANDLE_WIDTH, GROUP_BUTTON_HEIGHT)
    handle:SetPoint("LEFT", row, "LEFT", 0, 0)

    local handleTex = handle:CreateTexture(nil, "ARTWORK")
    handleTex:SetSize(DRAG_HANDLE_WIDTH - 2, GROUP_BUTTON_HEIGHT - 6)
    handleTex:SetPoint("CENTER", handle, "CENTER", 0, 0)
    handleTex:SetAtlas("UI-QuestTracker-Objective-Nub")
    handleTex:SetDesaturated(true)
    handleTex:SetAlpha(0.4)

    handle:SetScript("OnEnter", function()
        handleTex:SetAlpha(1.0)
        GameTooltip:SetOwner(handle, "ANCHOR_RIGHT")
        GameTooltip:SetText("Drag to reorder")
        GameTooltip:Show()
    end)

    handle:SetScript("OnLeave", function()
        if not dragState.active then
            handleTex:SetAlpha(0.4)
        end

        GameTooltip:Hide()
    end)

    handle:RegisterForDrag("LeftButton")

    handle:SetScript("OnDragStart", function()
        dragState.active = true
        dragState.sourceKey = key

        local ghost = getOrCreateDragGhost()
        ghost.text:SetText(getGroupDisplayName(group))
        ghost:Show()
    end)

    handle:SetScript("OnDragStop", function()
        finishDrag(true)
    end)

    -- Group select button (leaves room for handle on left and trash on right)
    local btnWidth = rowWidth - DRAG_HANDLE_WIDTH - TRASH_ICON_SIZE - 6
    local btn = CL.UI.CreateStyledButton(row, btnWidth, GROUP_BUTTON_HEIGHT, getGroupDisplayName(group))
    btn:SetPoint("LEFT", handle, "RIGHT", 0, 0)

    if key == selectedGroupKey then
        btn._selected = true
        local r, g, b = CL:HexToRGB(group.color or "ffffff")
        btn.text:SetTextColor(r, g, b, 1)
        btn:SetBackdropColor(unpack(CL.UI.BG_SELECTED))
        btn:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    end

    btn:SetScript("OnClick", function()
        selectGroup(key)
    end)

    -- Trash icon button
    local trash = CreateFrame("Button", nil, row)
    trash:SetSize(TRASH_ICON_SIZE, TRASH_ICON_SIZE)
    trash:SetPoint("LEFT", btn, "RIGHT", 4, 0)

    local trashIcon = trash:CreateTexture(nil, "ARTWORK")
    trashIcon:SetAllPoints()
    trashIcon:SetAtlas("transmog-icon-remove")
    trashIcon:SetAlpha(0.5)

    trash:SetScript("OnEnter", function()
        trashIcon:SetAlpha(1.0)
        GameTooltip:SetOwner(trash, "ANCHOR_RIGHT")
        GameTooltip:SetText("Delete Group")
        GameTooltip:Show()
    end)

    trash:SetScript("OnLeave", function()
        trashIcon:SetAlpha(0.5)
        GameTooltip:Hide()
    end)

    trash:SetScript("OnClick", function()
        deleteGroup(key)
    end)

    return row
end

function CL:RefreshGroupList()
    if not CL.optionsFrame then return end

    local scrollChild = CL.optionsFrame.groupScrollChild
    clearGroupButtons(scrollChild)

    local sorted = CL:GetSortedGroups()
    for index, entry in ipairs(sorted) do
        local row = createGroupButton(scrollChild, index, entry.key, entry.group)
        groupButtons[#groupButtons + 1] = row
    end

    scrollChild:SetHeight(math.max(1, #sorted * (GROUP_BUTTON_HEIGHT + 3)))
end

-------------------------------------------------------------------------------
--- Editor Panel (Right Panel - Top)
-------------------------------------------------------------------------------

local function clearItemRows()
    for _, row in ipairs(itemRows) do
        row:Hide()
        row:SetParent(nil)
    end

    wipe(itemRows)
end

local function createItemRow(parent, index, itemId, groupKey)
    local row = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    row:SetSize(parent:GetWidth(), ICON_SIZE)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (ICON_SIZE + 3))

    row:SetBackdrop(CL.UI.BACKDROP_NO_BORDER)
    row:SetBackdropColor(0.12, 0.12, 0.12, 0.5)

    -- Item icon
    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE - 4, ICON_SIZE - 4)
    icon:SetPoint("LEFT", row, "LEFT", 2, 0)

    local itemIcon = C_Item.GetItemIconByID(itemId)
    if itemIcon then
        icon:SetTexture(itemIcon)
    end

    -- Item name text
    local nameText = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    nameText:SetPoint("LEFT", icon, "RIGHT", 6, 0)
    local itemName = C_Item.GetItemNameByID(itemId)
    nameText:SetText(itemName or ("Item " .. itemId))

    if not itemName then
        local item = Item:CreateFromItemID(itemId)
        item:ContinueOnItemLoad(function()
            local loadedName = C_Item.GetItemNameByID(itemId)
            if loadedName then
                nameText:SetText(loadedName)
            end

            local loadedIcon = C_Item.GetItemIconByID(itemId)
            if loadedIcon then
                icon:SetTexture(loadedIcon)
            end
        end)
    end

    -- Item ID text
    local idText = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    idText:SetPoint("LEFT", nameText, "RIGHT", 8, 0)
    idText:SetText("(" .. itemId .. ")")
    idText:SetTextColor(0.5, 0.5, 0.5)

    -- Remove button
    local removeBtn = CreateFrame("Button", nil, row, "UIPanelCloseButton")
    removeBtn:SetSize(22, 22)
    removeBtn:SetPoint("RIGHT", row, "RIGHT", 0, 0)
    removeBtn:SetScript("OnClick", function()
        local group = CL.db.itemGroups[groupKey]
        if not group then return end

        for i, id in ipairs(group.itemIds) do
            if id == itemId then
                table.remove(group.itemIds, i)
                break
            end
        end

        CL:RefreshOptionsEditor()
        CL:RefreshBagPanel()
        CL:RebuildDisplay()
    end)

    -- Hover highlight
    row:EnableMouse(true)
    row:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.2, 0.2, 0.2, 0.7)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetItemByID(itemId)
        GameTooltip:Show()
    end)

    row:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
        GameTooltip:Hide()
    end)

    return row
end

function CL:RefreshOptionsEditor()
    if not CL.optionsFrame then return end

    local editor = CL.optionsFrame.editor
    clearItemRows()

    if not selectedGroupKey or not CL.db.itemGroups[selectedGroupKey] then
        editor:Hide()

        return
    end

    editor:Show()
    local group = CL.db.itemGroups[selectedGroupKey]

    -- Update fields
    editor.nameBox:SetText(group.name or "")
    editor.thresholdBox:SetText(tostring(group.threshold or 0))
    editor.thresholdSlider:SetValue(math.min(group.threshold or 0, 200))
    editor.restockBox:SetText(tostring(group.restock or 0))
    editor.restockSlider:SetValue(math.min(group.restock or 0, 200))
    editor.colorBox:SetText(group.color or "ffffff")

    -- Update color swatch
    local r, g, b = CL:HexToRGB(group.color or "ffffff")
    editor.colorSwatch:SetColorTexture(r, g, b, 1)

    -- Populate item list
    local itemsParent = editor.itemsScrollChild
    for i, itemId in ipairs(group.itemIds) do
        local row = createItemRow(itemsParent, i, itemId, selectedGroupKey)
        itemRows[#itemRows + 1] = row
    end

    itemsParent:SetHeight(math.max(1, #group.itemIds * (ICON_SIZE + 3)))
end

-------------------------------------------------------------------------------
--- Bag Panel (Right Panel - Bottom)
-------------------------------------------------------------------------------

local function clearBagButtons()
    for _, btn in ipairs(bagButtons) do
        btn:Hide()
        btn:SetParent(nil)
    end

    wipe(bagButtons)
end

local function findItemGroup(itemId)
    for key, group in pairs(CL.db.itemGroups) do
        for _, id in ipairs(group.itemIds) do
            if id == itemId then
                return key
            end
        end
    end

    return nil
end

local function removeItemFromGroup(itemId, groupKey)
    local group = CL.db.itemGroups[groupKey]
    if not group then return end

    for i, id in ipairs(group.itemIds) do
        if id == itemId then
            table.remove(group.itemIds, i)
            break
        end
    end

    CL:RefreshOptionsEditor()
    CL:RefreshBagPanel()
    CL:RebuildDisplay()
end

local function addItemToSelectedGroup(itemId)
    if not selectedGroupKey then
        CL:Print("Select an item group first.")

        return
    end

    local group = CL.db.itemGroups[selectedGroupKey]
    if not group then return end

    if findItemGroup(itemId) then
        CL:Print("Item already in a group.")

        return
    end

    group.itemIds[#group.itemIds + 1] = itemId

    if group.name == "New Group" or group.name == "Empty Group" then
        local itemName = C_Item.GetItemNameByID(itemId)
        if itemName then
            group.name = itemName
        end
    end

    CL:RefreshGroupList()
    CL:RefreshOptionsEditor()
    CL:RefreshBagPanel()
    CL:RebuildDisplay()
end

function CL:RefreshBagPanel()
    if not CL.optionsFrame then return end

    local bagParent = CL.optionsFrame.bagScrollChild
    clearBagButtons()

    local availableWidth = bagParent:GetWidth()
    local col = 0
    local row = 0
    local maxCols = math.floor(availableWidth / (ICON_SIZE + ICON_PADDING))
    local seenItems = {}

    for bag = 0, 4 do
        local numSlots = C_Container.GetContainerNumSlots(bag)
        for slot = 1, numSlots do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info and info.itemID and not seenItems[info.itemID] then
                seenItems[info.itemID] = true

                -- Filter by item class
                local passesFilter = true
                local hasAnyFilter = next(activeBagFilters) ~= nil
                if hasAnyFilter then
                    local classID = select(12, GetItemInfo(info.itemID))
                    if classID == nil or not activeBagFilters[classID] then
                        passesFilter = false
                    end
                end

                if passesFilter then
                    local itemId = info.itemID
                    local owningGroup = findItemGroup(itemId)

                    local btn = CreateFrame("Button", nil, bagParent)
                    btn:SetSize(ICON_SIZE, ICON_SIZE)
                    btn:SetPoint("TOPLEFT", bagParent, "TOPLEFT",
                        col * (ICON_SIZE + ICON_PADDING),
                        -(row * (ICON_SIZE + ICON_PADDING)))

                    local icon = btn:CreateTexture(nil, "ARTWORK")
                    icon:SetAllPoints()
                    icon:SetTexture(info.iconFileID)

                    -- Hover overlay (hidden by default, shown on enter)
                    local overlay = btn:CreateTexture(nil, "OVERLAY")
                    overlay:SetAllPoints()
                    overlay:Hide()

                    -- Status icon overlay (+ or circle-slash)
                    local statusIcon = btn:CreateTexture(nil, "OVERLAY", nil, 1)
                    local iconSize = ICON_SIZE * 0.8
                    statusIcon:SetSize(iconSize, iconSize)
                    statusIcon:SetPoint("CENTER", btn, "CENTER", 0, 0)
                    statusIcon:Hide()

                    if owningGroup then
                        icon:SetDesaturated(true)
                        icon:SetAlpha(0.5)
                        overlay:SetColorTexture(0.8, 0, 0, 0.4)
                        statusIcon:SetAtlas("transmog-icon-remove")
                    else
                        overlay:SetColorTexture(0, 0.6, 0, 0.35)
                        statusIcon:SetTexture("Interface\\PaperDollInfoFrame\\Character-Plus")
                        statusIcon:SetVertexColor(0, 1, 0)
                    end

                    btn:SetScript("OnClick", function()
                        if owningGroup then
                            if owningGroup == selectedGroupKey then
                                removeItemFromGroup(itemId, owningGroup)
                            else
                                local itemName = C_Item.GetItemNameByID(itemId) or ("Item " .. itemId)
                                local group = CL.db.itemGroups[owningGroup]
                                local groupName = group and group.name or owningGroup
                                local dialog = StaticPopup_Show("CONSUMABLESLIST_REMOVE_ITEM", itemName, groupName)
                                if dialog then
                                    dialog.data = { itemId = itemId, groupKey = owningGroup }
                                end
                            end
                        else
                            addItemToSelectedGroup(itemId)
                        end
                    end)

                    btn:SetScript("OnEnter", function(self)
                        overlay:Show()
                        statusIcon:Show()
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:SetBagItem(bag, slot)
                        if owningGroup then
                            local group = CL.db.itemGroups[owningGroup]
                            local groupName = group and group.name or owningGroup
                            GameTooltip:AddLine(" ")
                            GameTooltip:AddLine("In group: " .. groupName, 1, 0.5, 0.5)
                            GameTooltip:AddLine("Click to remove", 0.8, 0.2, 0.2)
                        else
                            GameTooltip:AddLine(" ")
                            GameTooltip:AddLine("Click to add to selected group", 0.2, 0.8, 0.2)
                        end
                        GameTooltip:Show()
                    end)

                    btn:SetScript("OnLeave", function()
                        overlay:Hide()
                        statusIcon:Hide()
                        GameTooltip:Hide()
                    end)

                    bagButtons[#bagButtons + 1] = btn

                    col = col + 1
                    if col >= maxCols then
                        col = 0
                        row = row + 1
                    end
                end
            end
        end
    end

    bagParent:SetHeight(math.max(1, (row + 1) * (ICON_SIZE + ICON_PADDING)))
end

-------------------------------------------------------------------------------
--- Build Editor
-------------------------------------------------------------------------------

local function applyColor(editor, hex)
    local group = CL.db.itemGroups[selectedGroupKey]
    if not group then return end

    group.color = hex
    editor.colorBox:SetText(hex)
    local r, g, b = CL:HexToRGB(hex)
    editor.colorSwatch:SetColorTexture(r, g, b, 1)
    CL:RefreshGroupList()
    CL:RebuildDisplay()
end

local function buildEditor(parent, rightWidth, editorHeight)
    local editor = CreateFrame("Frame", nil, parent)
    editor:SetPoint("TOPLEFT", parent, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, 0)
    editor:SetSize(rightWidth, editorHeight)
    editor:Hide()

    local labelX = 0

    -- Row 1: Display Name + Color
    local colorSwatchSize = 22
    local colorBoxWidth = 90
    local colorSectionWidth = 50 + colorBoxWidth + 8 + colorSwatchSize
    local nameFieldX = 100
    local nameBoxWidth = rightWidth - nameFieldX - colorSectionWidth - INSET_PADDING - 8

    CL.UI.CreateLabel(editor, "Display Name:", labelX, -5)
    editor.nameBox = CL.UI.CreateStyledEditBox(editor, nameBoxWidth, nameFieldX, 0)
    editor.nameBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local group = CL.db.itemGroups[selectedGroupKey]
        if not group then return end

        local text = self:GetText()
        if text == "" then
            local firstItemName = group.itemIds[1] and C_Item.GetItemNameByID(group.itemIds[1])
            text = firstItemName or "Empty Group"
            self:SetText(text)
        end

        group.name = text
        CL:RefreshGroupList()
        CL:RebuildDisplay()
    end)

    local colorLabelX = nameFieldX + nameBoxWidth + 8
    CL.UI.CreateLabel(editor, "Color:", colorLabelX, -5)
    editor.colorBox = CL.UI.CreateStyledEditBox(editor, colorBoxWidth, colorLabelX + 50, 0)
    editor.colorBox:SetMaxLetters(6)
    editor.colorBox:HookScript("OnEditFocusGained", function(self)
        self:HighlightText()
    end)
    editor.colorBox:SetScript("OnTextChanged", function(self, userInput)
        if not userInput then return end

        local text = self:GetText()
        local cleaned = text:gsub("#", "")
        if cleaned ~= text then
            self:SetText(cleaned)
        end
    end)

    local swatchBtn = CreateFrame("Button", nil, editor, "BackdropTemplate")
    swatchBtn:SetSize(colorSwatchSize, colorSwatchSize)
    swatchBtn:SetPoint("LEFT", editor.colorBox, "RIGHT", 8, 0)
    swatchBtn:SetBackdrop(CL.UI.CONTAINER_BACKDROP)
    swatchBtn:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)

    editor.colorSwatch = swatchBtn:CreateTexture(nil, "ARTWORK")
    editor.colorSwatch:SetPoint("TOPLEFT", swatchBtn, "TOPLEFT", 3, -3)
    editor.colorSwatch:SetPoint("BOTTOMRIGHT", swatchBtn, "BOTTOMRIGHT", -3, 3)

    swatchBtn:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Click to pick a color")
        GameTooltip:Show()
    end)

    swatchBtn:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        GameTooltip:Hide()
    end)

    swatchBtn:SetScript("OnClick", function()
        local group = CL.db.itemGroups[selectedGroupKey]
        if not group then return end

        local r, g, b = CL:HexToRGB(group.color or "ffffff")
        local prevHex = group.color or "ffffff"

        local info = {
            swatchFunc = function()
                local newR, newG, newB = ColorPickerFrame:GetColorRGB()
                local hex = string.format("%02x%02x%02x",
                    math.floor(newR * 255 + 0.5),
                    math.floor(newG * 255 + 0.5),
                    math.floor(newB * 255 + 0.5))
                applyColor(editor, hex)
            end,
            cancelFunc = function()
                applyColor(editor, prevHex)
            end,
            r = r,
            g = g,
            b = b,
            hasOpacity = false,
        }

        ColorPickerFrame:SetupColorPickerAndShow(info)
    end)

    editor.colorBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local hex = self:GetText()
        if #hex == 6 then
            applyColor(editor, hex)
        end
    end)

    -- Row 2: Threshold + Restock (side by side sliders)
    local halfWidth = math.floor((rightWidth - INSET_PADDING) / 2)
    local sliderFieldX = 76
    local sliderBoxWidth = 46
    local sliderPadding = 16

    -- Threshold (left half)
    CL.UI.CreateLabel(editor, "Threshold:", labelX, -35)
    editor.thresholdBox = CL.UI.CreateStyledEditBox(editor, sliderBoxWidth, sliderFieldX, -30)
    editor.thresholdBox:SetNumeric(true)

    local thresholdSlider = CreateFrame("Slider", nil, editor, "MinimalSliderTemplate")
    thresholdSlider:SetSize(halfWidth - sliderFieldX - sliderBoxWidth - sliderPadding, 20)
    thresholdSlider:SetPoint("LEFT", editor.thresholdBox, "RIGHT", 8, 0)
    thresholdSlider:SetMinMaxValues(0, 200)
    thresholdSlider:SetValueStep(1)
    thresholdSlider:SetObeyStepOnDrag(true)
    editor.thresholdSlider = thresholdSlider

    thresholdSlider:SetScript("OnValueChanged", function(self, value)
        local val = math.floor(value + 0.5)
        editor.thresholdBox:SetText(tostring(val))
        local group = CL.db.itemGroups[selectedGroupKey]
        if not group then return end

        group.threshold = val
        CL:RebuildDisplay()
    end)

    editor.thresholdBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local group = CL.db.itemGroups[selectedGroupKey]
        if not group then return end

        local val = self:GetNumber()
        group.threshold = val
        editor.thresholdSlider:SetValue(math.min(val, 200))
        CL:RebuildDisplay()
    end)

    -- Restock (right half)
    local restockLabelX = halfWidth + 8
    CL.UI.CreateLabel(editor, "Restock:", restockLabelX, -35)
    editor.restockBox = CL.UI.CreateStyledEditBox(editor, sliderBoxWidth,
        restockLabelX + sliderFieldX, -30)
    editor.restockBox:SetNumeric(true)

    local restockSlider = CreateFrame("Slider", nil, editor, "MinimalSliderTemplate")
    restockSlider:SetSize(rightWidth - restockLabelX - sliderFieldX - sliderBoxWidth
        - sliderPadding - INSET_PADDING, 20)
    restockSlider:SetPoint("LEFT", editor.restockBox, "RIGHT", 8, 0)
    restockSlider:SetMinMaxValues(0, 200)
    restockSlider:SetValueStep(1)
    restockSlider:SetObeyStepOnDrag(true)
    editor.restockSlider = restockSlider

    restockSlider:SetScript("OnValueChanged", function(self, value)
        local val = math.floor(value + 0.5)
        editor.restockBox:SetText(tostring(val))
        local group = CL.db.itemGroups[selectedGroupKey]
        if not group then return end

        group.restock = val
    end)

    editor.restockBox:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local group = CL.db.itemGroups[selectedGroupKey]
        if not group then return end

        local val = self:GetNumber()
        group.restock = val
        editor.restockSlider:SetValue(math.min(val, 200))
    end)

    -- Items label
    CL.UI.CreateLabel(editor, "Items in Group:", labelX, -70)

    -- Items scroll container
    local itemsTop = 88
    local bottomControlsHeight = 36
    local itemsContainerHeight = editorHeight - itemsTop - bottomControlsHeight

    local itemsContainer, itemsScroll, itemsChild = CL.UI.CreateScrollContainer(
        editor, rightWidth, itemsContainerHeight, 0, -itemsTop)
    editor.itemsScrollChild = itemsChild

    -- Add by ID row
    local addRowY = -(itemsTop + itemsContainerHeight + 8)
    CL.UI.CreateLabel(editor, "Add Item by ID:", labelX, addRowY - 5)
    editor.addIdBox = CL.UI.CreateStyledEditBox(editor, 100, nameFieldX, addRowY)
    editor.addIdBox:SetNumeric(true)
    editor.addIdBox:SetScript("OnEnterPressed", function(self)
        local itemId = self:GetNumber()
        if itemId <= 0 then return end

        addItemToSelectedGroup(itemId)
        self:SetText("")
        self:ClearFocus()
    end)

    local addBtn = CL.UI.CreateStyledButton(editor, 50, 22, "Add")
    addBtn:SetPoint("LEFT", editor.addIdBox, "RIGHT", 6, 0)
    addBtn:SetScript("OnClick", function()
        local itemId = editor.addIdBox:GetNumber()
        if itemId <= 0 then return end

        addItemToSelectedGroup(itemId)
        editor.addIdBox:SetText("")
        editor.addIdBox:ClearFocus()
    end)

    return editor
end

-------------------------------------------------------------------------------
--- Build Options Frame
-------------------------------------------------------------------------------

local function updateFilterBtnState(fbtn, ficon, classID)
    if activeBagFilters[classID] then
        fbtn:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
        ficon:SetDesaturated(false)
        ficon:SetAlpha(1.0)
    else
        fbtn:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
        ficon:SetDesaturated(true)
        ficon:SetAlpha(1.0)
    end
end

local function buildOptionsFrame()
    if CL.optionsFrame then return end

    -- Main frame with dark backdrop
    local frame = CreateFrame("Frame", "ConsumablesListOptionsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(PANEL_WIDTH, PANEL_HEIGHT)
    frame:SetPoint("CENTER")
    frame:SetBackdrop(CL.UI.BACKDROP)
    frame:SetBackdropColor(0.08, 0.08, 0.08, 0.95)
    frame:SetBackdropBorderColor(unpack(CL.UI.BORDER_NORMAL))
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetFrameStrata("HIGH")
    frame:SetToplevel(true)
    frame:RegisterForDrag("LeftButton")
    frame:Hide()

    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)

    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    -- Title
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING + 2, -INSET_PADDING)
    title:SetText("Consumables List - Options")
    title:SetTextColor(unpack(CL.UI.GOLD))

    -- Close button
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetSize(24, 24)
    closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5)
    closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)

    -- Title divider
    local titleDivider = frame:CreateTexture(nil, "ARTWORK")
    titleDivider:SetHeight(2)
    titleDivider:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -36)
    titleDivider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -INSET_PADDING, -36)
    titleDivider:SetColorTexture(0.2, 0.2, 0.2, 1)

    -- Content area (below divider)
    local content = CreateFrame("Frame", nil, frame)
    content:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -42)
    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -INSET_PADDING, INSET_PADDING)

    local contentHeight = PANEL_HEIGHT - 42 - INSET_PADDING
    local contentWidth = PANEL_WIDTH - (INSET_PADDING * 2)
    local rightWidth = contentWidth - GROUP_LIST_WIDTH - INSET_PADDING

    ---------------------------------------------------------------------------
    -- Left panel: Group list (full height)
    ---------------------------------------------------------------------------
    CL.UI.CreateLabel(content, "Item Groups", 2, -2)

    local addGroupBtn = CL.UI.CreateStyledButton(content,
        GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT, "+ Add New Group")
    addGroupBtn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20)
    addGroupBtn:SetScript("OnClick", function()
        local key = generateGroupKey()
        CL.db.itemGroups[key] = {
            itemIds = {},
            threshold = 10,
            restock = 10,
            color = "ffffff",
            name = "New Group",
            order = getNextOrder(),
        }
        selectGroup(key)
        CL:RebuildDisplay()
    end)

    -- Group list scroll container (full height, bottom-aligned with content)
    local groupScrollTop = 50
    local groupContainerHeight = contentHeight - groupScrollTop

    local groupContainer, groupScroll, groupChild = CL.UI.CreateScrollContainer(
        content, GROUP_LIST_WIDTH, groupContainerHeight, 0, -groupScrollTop)
    frame.groupScrollChild = groupChild

    -- Vertical separator between left and right panels
    local vSep = content:CreateTexture(nil, "ARTWORK")
    vSep:SetWidth(2)
    vSep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + 6, 0)
    vSep:SetPoint("BOTTOMLEFT", content, "BOTTOMLEFT", GROUP_LIST_WIDTH + 6, 0)
    vSep:SetColorTexture(0.2, 0.2, 0.2, 1)

    ---------------------------------------------------------------------------
    -- Right panel: Editor (top) + Bag items (bottom)
    ---------------------------------------------------------------------------
    local bagLabelHeight = 28
    local editorHeight = contentHeight - BAG_PANEL_HEIGHT - bagLabelHeight - INSET_PADDING

    -- Editor
    frame.editor = buildEditor(content, rightWidth, editorHeight)

    -- Horizontal separator above bag panel
    local bagSectionTop = editorHeight + 8
    local hSep = content:CreateTexture(nil, "ARTWORK")
    hSep:SetHeight(2)
    hSep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, -bagSectionTop)
    hSep:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, -bagSectionTop)
    hSep:SetColorTexture(0.2, 0.2, 0.2, 1)

    -- Bag items label and filter buttons
    local bagLabel = CL.UI.CreateLabel(content, "Inventory (Click to add / remove from Group):",
        GROUP_LIST_WIDTH + INSET_PADDING, -(bagSectionTop + 10))

    local FILTER_BTN_SIZE = 24
    local FILTER_BTN_SPACING = 2
    local numFilters = #ITEM_CLASS_FILTERS
    local totalFiltersWidth = numFilters * FILTER_BTN_SIZE + (numFilters - 1) * FILTER_BTN_SPACING
    for i, filterInfo in ipairs(ITEM_CLASS_FILTERS) do
        local fbtn = CreateFrame("Button", nil, content, "BackdropTemplate")
        fbtn:SetSize(FILTER_BTN_SIZE, FILTER_BTN_SIZE)
        fbtn:SetPoint("TOPRIGHT", content, "TOPRIGHT",
            -(totalFiltersWidth - (i * (FILTER_BTN_SIZE + FILTER_BTN_SPACING)) + FILTER_BTN_SPACING),
            -(bagSectionTop + 6))

        fbtn:SetBackdrop(CL.UI.CONTAINER_BACKDROP)

        local ficon = fbtn:CreateTexture(nil, "ARTWORK")
        ficon:SetPoint("TOPLEFT", fbtn, "TOPLEFT", 2, -2)
        ficon:SetPoint("BOTTOMRIGHT", fbtn, "BOTTOMRIGHT", -2, 2)
        ficon:SetTexture(filterInfo.icon)

        updateFilterBtnState(fbtn, ficon, filterInfo.classID)

        fbtn:SetScript("OnClick", function()
            if activeBagFilters[filterInfo.classID] then
                activeBagFilters[filterInfo.classID] = nil
            else
                activeBagFilters[filterInfo.classID] = true
            end

            updateFilterBtnState(fbtn, ficon, filterInfo.classID)
            CL:RefreshBagPanel()
        end)

        fbtn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            local state = activeBagFilters[filterInfo.classID] and "|cff00ff00ON|r" or "|cffff0000OFF|r"
            GameTooltip:SetText(filterInfo.name .. " " .. state)
            GameTooltip:Show()
        end)

        fbtn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        bagFilterButtons[#bagFilterButtons + 1] = fbtn
    end

    -- Bag items scroll container (bottom-aligned with group list)
    local bagContainerTop = bagSectionTop + bagLabelHeight
    local bagContainerHeight = contentHeight - bagContainerTop

    local bagContainer, bagScroll, bagChild = CL.UI.CreateScrollContainer(
        content, rightWidth, bagContainerHeight,
        GROUP_LIST_WIDTH + INSET_PADDING, -bagContainerTop)
    frame.bagScrollChild = bagChild

    -- Scale button (left side of frame)
    local SCALE_MIN = 50
    local SCALE_MAX = 150
    local SCALE_STEP = 5
    local POPUP_SLIDER_HEIGHT = 120

    local scaleBtn = CreateFrame("Button", nil, frame, "BackdropTemplate")
    scaleBtn:SetSize(80, 20)
    scaleBtn:SetPoint("RIGHT", closeBtn, "LEFT", -4, 0)
    scaleBtn:SetBackdrop(CL.UI.BACKDROP)
    scaleBtn:SetBackdropColor(0.08, 0.08, 0.08, 0.95)
    scaleBtn:SetBackdropBorderColor(unpack(CL.UI.BORDER_NORMAL))

    local scaleBtnText = scaleBtn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    scaleBtnText:SetPoint("CENTER", scaleBtn, "CENTER", 0, 0)

    scaleBtn:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT", 0, 0)
        GameTooltip:SetText("Click and drag to adjust scale")
        GameTooltip:Show()
    end)

    scaleBtn:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(unpack(CL.UI.BORDER_NORMAL))
        GameTooltip:Hide()
    end)

    -- Popup slider layout
    local POPUP_WIDTH = 44
    local POPUP_PADDING_X = 12
    local POPUP_PADDING_Y = 24
    local POPUP_LABEL_GAP = 4
    local POPUP_HEIGHT = POPUP_SLIDER_HEIGHT + (POPUP_PADDING_Y * 2)

    local popupSlider = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    popupSlider:SetSize(POPUP_WIDTH, POPUP_HEIGHT)
    popupSlider:SetBackdrop(CL.UI.BACKDROP)
    popupSlider:SetBackdropColor(0.08, 0.08, 0.08, 0.95)
    popupSlider:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    popupSlider:SetFrameStrata("TOOLTIP")
    popupSlider:Hide()

    local sliderTrack = popupSlider:CreateTexture(nil, "BACKGROUND")
    sliderTrack:SetSize(2, POPUP_SLIDER_HEIGHT)
    sliderTrack:SetPoint("CENTER", popupSlider, "CENTER", 0, 0)
    sliderTrack:SetColorTexture(0.4, 0.4, 0.4, 0.8)

    local slider = CreateFrame("Slider", nil, popupSlider, "MinimalSliderTemplate")
    slider:SetOrientation("VERTICAL")
    slider:SetSize(20, POPUP_SLIDER_HEIGHT)
    slider:SetPoint("CENTER", popupSlider, "CENTER", 0, 0)
    slider:SetMinMaxValues(SCALE_MIN, SCALE_MAX)
    slider:SetValueStep(SCALE_STEP)
    slider:SetObeyStepOnDrag(true)
    slider:EnableMouse(false)

    local popupLabel = popupSlider:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    popupLabel:SetPoint("BOTTOM", slider, "TOP", 0, POPUP_LABEL_GAP)
    popupLabel:SetText("Scale")
    popupLabel:SetTextColor(unpack(CL.UI.GOLD))

    local popupValue = popupSlider:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    popupValue:SetPoint("TOP", slider, "BOTTOM", 0, -POPUP_LABEL_GAP)

    local dragStartY = nil

    local function snapToStep(val)
        return math.floor(val / SCALE_STEP + 0.5) * SCALE_STEP
    end

    -- Vertical sliders map min=top, max=bottom. We invert so up=bigger.
    local function toSlider(realVal)
        return SCALE_MAX + SCALE_MIN - realVal
    end

    local function fromSlider(sliderVal)
        return SCALE_MAX + SCALE_MIN - sliderVal
    end

    local function applyScale(val)
        local scale = val / 100
        scaleBtnText:SetText("Scale: " .. val .. "%")
        popupValue:SetText(val .. "%")
        frame:SetScale(scale)
        ConsumablesListDB.settings.optionsScale = scale
    end

    local function finishScaleDrag()
        if not dragStartY then return end
        dragStartY = nil

        popupSlider:SetScript("OnUpdate", nil)
        popupSlider:Hide()
    end

    scaleBtn:SetScript("OnMouseDown", function(self, button)
        if button ~= "LeftButton" then return end
        GameTooltip:Hide()

        local mouseX, mouseY = GetCursorPosition()
        local uiScale = UIParent:GetEffectiveScale()
        dragStartY = mouseY / uiScale
        local popupWidth = popupSlider:GetWidth()

        popupSlider:ClearAllPoints()
        popupSlider:SetPoint("TOP", UIParent, "BOTTOMLEFT",
            mouseX / uiScale, dragStartY + POPUP_HEIGHT / 2)
        popupSlider:Show()

        popupSlider:SetScript("OnUpdate", function()
            if not IsMouseButtonDown("LeftButton") then
                finishScaleDrag()

                return
            end

            local _, cursorY = GetCursorPosition()
            cursorY = cursorY / UIParent:GetEffectiveScale()
            local delta = cursorY - dragStartY

            local pixelsPerUnit = POPUP_SLIDER_HEIGHT * 2
                / (SCALE_MAX - SCALE_MIN)
            local valueDelta = delta / pixelsPerUnit
            local currentReal = fromSlider(slider:GetValue())
            local newVal = snapToStep(currentReal + valueDelta)
            newVal = math.max(SCALE_MIN, math.min(SCALE_MAX, newVal))

            if newVal ~= currentReal then
                slider:SetValue(toSlider(newVal))
                dragStartY = cursorY
            end
        end)
    end)

    slider:SetScript("OnValueChanged", function(self, value)
        applyScale(math.floor(fromSlider(value) + 0.5))
    end)

    local savedScale = ConsumablesListDB.settings.optionsScale or 1
    frame:SetScale(savedScale)
    local initVal = math.floor(savedScale * 100 + 0.5)
    slider:SetValue(toSlider(initVal))
    scaleBtnText:SetText("Scale: " .. initVal .. "%")
    popupValue:SetText(initVal .. "%")

    CL.optionsFrame = frame
end

-------------------------------------------------------------------------------
--- Public API
-------------------------------------------------------------------------------

function CL:OpenOptions()
    buildOptionsFrame()

    if CL.optionsFrame:IsShown() then
        CL.optionsFrame:Hide()
    else
        CL.optionsFrame:Show()
        CL:RefreshGroupList()
        CL:RefreshOptionsEditor()
        CL:RefreshBagPanel()
    end
end


-------------------------------------------------------------------------------
--- Settings Panel (WoW Settings API - Vertical Layout)
-------------------------------------------------------------------------------

local function GetFontOptions()
    local LSM = LibStub("LibSharedMedia-3.0")
    local container = Settings.CreateControlTextContainer()
    for _, fontName in ipairs(LSM:List("font")) do
        container:Add(fontName, fontName)
    end

    return container:GetData()
end

function CL:RegisterSettings()
    local settings = ConsumablesListDB.settings
    local category, layout = Settings.RegisterVerticalLayoutCategory("Consumables List")

    -- Open Group Editor button
    local openEditorInitializer = CreateSettingsButtonInitializer(
        "Group Editor", "Open", function() CL:OpenOptions() end,
        "Open the item group editor (/cl o)", false
    )
    layout:AddInitializer(openEditorInitializer)

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer("General"))

    -- Enable Addon
    local enabledSetting = Settings.RegisterAddOnSetting(
        category, "enabled", "enabled", settings, "boolean",
        "Enable Addon", CL.db.settingsDefaults.enabled
    )
    Settings.CreateCheckbox(category, enabledSetting, "Show or hide the consumables list HUD.")
    Settings.SetOnValueChangedCallback("enabled", function(_, setting, newValue)
        CL:HideOrShowUpdate(true)
    end)

    -- Always Use Full Names
    local fullNamesSetting = Settings.RegisterAddOnSetting(
        category, "useFullNames", "useFullNames", settings, "boolean",
        "Always Use Full Names", CL.db.settingsDefaults.useFullNames
    )
    Settings.CreateCheckbox(category, fullNamesSetting, "Show full item names instead of group nicknames.")
    Settings.SetOnValueChangedCallback("useFullNames", function(_, setting, newValue)
        CL.fullItemNames = newValue
        CL:RebuildDisplay()
    end)

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer("Display"))

    -- Font dropdown
    local fontSetting = Settings.RegisterAddOnSetting(
        category, "fontName", "fontName", settings, "string",
        "Font", CL.db.settingsDefaults.fontName
    )
    Settings.CreateDropdown(category, fontSetting, GetFontOptions, "Select the font for the HUD text.")
    Settings.SetOnValueChangedCallback("fontName", function(_, setting, newValue)
        CL:ApplyDisplaySettings()
    end)

    -- Font Size slider
    local fontSizeSetting = Settings.RegisterAddOnSetting(
        category, "fontSize", "fontSize", settings, "number",
        "Font Size", CL.db.settingsDefaults.fontSize
    )
    local fontSizeOptions = Settings.CreateSliderOptions(12, 48, 1)
    fontSizeOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right,
        function(value) return tostring(math.floor(value + 0.5)) end)
    Settings.CreateSlider(category, fontSizeSetting, fontSizeOptions, "Set the font size for the HUD text.")
    Settings.SetOnValueChangedCallback("fontSize", function(_, setting, newValue)
        CL:ApplyDisplaySettings()
    end)

    -- Line Height slider
    local lineHeightSetting = Settings.RegisterAddOnSetting(
        category, "lineHeight", "lineHeight", settings, "number",
        "Line Height", CL.db.settingsDefaults.lineHeight
    )
    local lineHeightOptions = Settings.CreateSliderOptions(14, 60, 1)
    lineHeightOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right,
        function(value) return tostring(math.floor(value + 0.5)) end)
    Settings.CreateSlider(category, lineHeightSetting, lineHeightOptions, "Set the row height for the HUD text.")
    Settings.SetOnValueChangedCallback("lineHeight", function(_, setting, newValue)
        CL:ApplyDisplaySettings()
    end)

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer("Visibility"))

    -- Show outside of cities
    local outsideOfCitySetting = Settings.RegisterAddOnSetting(
        category, "showOutsideOfCities", "showOutsideOfCities", settings, "boolean",
        "Show Outside of Cities", CL.db.settingsDefaults.showOutsideOfCities
    )
    Settings.CreateCheckbox(category, outsideOfCitySetting, "Show the list when outside of a city.")
    Settings.SetOnValueChangedCallback("showOutsideOfCities", function(_, setting, newValue)
        CL:HideOrShowUpdate(true)
    end)

    -- Show in Neighborhood
    local neighborhoodSetting = Settings.RegisterAddOnSetting(
        category, "showInNeighborhood", "showInNeighborhood", settings, "boolean",
        "Show in Neighborhood", CL.db.settingsDefaults.showInNeighborhood
    )
    Settings.CreateCheckbox(category, neighborhoodSetting, "Show the list when inside a neighborhood instance.")
    Settings.SetOnValueChangedCallback("showInNeighborhood", function(_, setting, newValue)
        CL:HideOrShowUpdate(true)
    end)

    -- Show on AH Mount
    local ahMountSetting = Settings.RegisterAddOnSetting(
        category, "showOnAHMount", "showOnAHMount", settings, "boolean",
        "Show on AH Mount", CL.db.settingsDefaults.showOnAHMount
    )
    Settings.CreateCheckbox(category, ahMountSetting, "Show the list when mounted on a Brutosaur auction house mount.")
    Settings.SetOnValueChangedCallback("showOnAHMount", function(_, setting, newValue)
        CL:HideOrShowUpdate(true)
    end)

    Settings.RegisterAddOnCategory(category)
    CL.settingsCategory = category
end

function CL:OpenSettings()
    Settings.OpenToCategory(CL.settingsCategory:GetID())
end

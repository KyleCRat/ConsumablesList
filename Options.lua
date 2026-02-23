local ADDON_NAME, CL = ...

-------------------------------------------------------------------------------
--- Options Panel
-------------------------------------------------------------------------------

local PANEL_WIDTH = 860
local PANEL_HEIGHT = 540
local SCROLLBAR_WIDTH = 20
local INSET_PADDING = 14
local CONTAINER_PADDING = 4

local GROUP_LIST_WIDTH = 220
local BAG_PANEL_HEIGHT = 160
local ICON_SIZE = 34
local ICON_PADDING = 4
local GROUP_BUTTON_HEIGHT = 26
local TRASH_ICON_SIZE = 18

local GOLD = { 1, 0.82, 0, 1 }
local BORDER_NORMAL = { 0.6, 0.6, 0.6, 1 }
local BORDER_HIGHLIGHT = { 1, 0.82, 0, 1 }
local BG_NORMAL = { 0.15, 0.15, 0.15, 1 }
local BG_HOVER = { 0.25, 0.25, 0.25, 1 }
local BG_PRESS = { 0.1, 0.1, 0.1, 1 }
local BG_SELECTED = { 0.2, 0.18, 0.1, 1 }

local BACKDROP = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
}

local BACKDROP_NO_BORDER = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    tile = true,
    tileSize = 16,
    insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

local CONTAINER_BACKDROP = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 10,
    insets = { left = 2, right = 2, top = 2, bottom = 2 },
}

local selected_group_key = nil
local group_buttons = {}
local item_rows = {}
local bag_buttons = {}
local bag_filter_buttons = {}

-- Item class filters: classID -> { name, icon }
local ITEM_CLASS_FILTERS = {
    { classID = 0,  name = "Consumable",        icon = 134830 },  -- INV_Potion_93 (red potion)
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

local active_bag_filters = { [0] = true }  -- Default: Consumables only

-------------------------------------------------------------------------------
--- Delete Confirmation Dialog
-------------------------------------------------------------------------------

StaticPopupDialogs["CONSUMABLESLIST_DELETE_GROUP"] = {
    text = "Are you sure you want to delete \"%s\"?",
    button1 = "Delete",
    button2 = "Cancel",
    OnAccept = function(self, group_key)
        CL.db.item_groups[group_key] = nil

        if selected_group_key == group_key then
            selected_group_key = nil
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
        local group = CL.db.item_groups[data.group_key]
        if not group then return end

        for i, id in ipairs(group.item_ids) do
            if id == data.item_id then
                table.remove(group.item_ids, i)
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
--- Styled Widget Constructors
-------------------------------------------------------------------------------

local function create_styled_button(parent, width, height, text)
    local button = CreateFrame("Button", nil, parent, "BackdropTemplate")
    button:SetSize(width, height)
    button:SetBackdrop(BACKDROP)
    button:SetBackdropColor(unpack(BG_NORMAL))
    button:SetBackdropBorderColor(unpack(BORDER_NORMAL))

    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.text:SetPoint("LEFT", button, "LEFT", 6, 0)
    button.text:SetPoint("RIGHT", button, "RIGHT", -6, 0)
    button.text:SetWordWrap(false)
    button.text:SetNonSpaceWrap(false)
    button.text:SetText(text)
    button.text:SetTextColor(unpack(GOLD))

    button:SetScript("OnEnter", function(self)
        self:SetBackdropColor(unpack(BG_HOVER))
        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
    end)

    button:SetScript("OnLeave", function(self)
        if self._selected then
            self:SetBackdropColor(unpack(BG_SELECTED))
            self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
        else
            self:SetBackdropColor(unpack(BG_NORMAL))
            self:SetBackdropBorderColor(unpack(BORDER_NORMAL))
        end
    end)

    button:SetScript("OnMouseDown", function(self)
        self:SetBackdropColor(unpack(BG_PRESS))
        self.text:ClearAllPoints()
        self.text:SetPoint("LEFT", self, "LEFT", 7, -1)
        self.text:SetPoint("RIGHT", self, "RIGHT", -5, -1)
    end)

    button:SetScript("OnMouseUp", function(self)
        self:SetBackdropColor(unpack(BG_HOVER))
        self.text:ClearAllPoints()
        self.text:SetPoint("LEFT", self, "LEFT", 6, 0)
        self.text:SetPoint("RIGHT", self, "RIGHT", -6, 0)
    end)

    return button
end

local function create_styled_editbox(parent, width, x, y)
    local box = CreateFrame("EditBox", nil, parent, "BackdropTemplate")
    box:SetSize(width, 22)
    box:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    box:SetAutoFocus(false)
    box:SetFontObject(GameFontHighlight)

    box:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    box:SetBackdropColor(0.1, 0.1, 0.1, 1)
    box:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    box:SetTextInsets(6, 6, 0, 0)

    box:SetScript("OnEditFocusGained", function(self)
        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
    end)

    box:SetScript("OnEditFocusLost", function(self)
        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    end)

    box:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)

    return box
end

local function create_label(parent, text, x, y)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    label:SetText(text)
    label:SetTextColor(unpack(GOLD))

    return label
end

local function create_scroll_container(parent, width, height, x, y)
    -- Outer bordered frame
    local container = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    container:SetSize(width, height)
    container:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    container:SetBackdrop(CONTAINER_BACKDROP)
    container:SetBackdropColor(0.04, 0.04, 0.04, 0.9)
    container:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)

    -- Scroll frame inside container, leaving room for scrollbar on right
    local inner_padding = CONTAINER_PADDING + 1
    local scroll = CreateFrame("ScrollFrame", nil, container, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", container, "TOPLEFT", inner_padding, -inner_padding)
    scroll:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(inner_padding + SCROLLBAR_WIDTH), inner_padding)

    -- Nudge the scrollbar left so it sits inside the container border
    local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
    if scrollbar then
        scrollbar:ClearAllPoints()
        scrollbar:SetPoint("TOPRIGHT", container, "TOPRIGHT", -(inner_padding), -(inner_padding + 16))
        scrollbar:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(inner_padding), (inner_padding + 16))
    end

    -- Consume mouse wheel on the container so it never falls through to game bindings
    container:EnableMouseWheel(true)
    container:SetScript("OnMouseWheel", function(_, delta)
        local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
        if scrollbar then
            local current = scrollbar:GetValue()
            local min_val, max_val = scrollbar:GetMinMaxValues()
            local step = scrollbar:GetValueStep() or (max_val - min_val) / 10
            local new_val = math.max(min_val, math.min(max_val, current - (delta * step)))
            scrollbar:SetValue(new_val)
        end
    end)

    local child_width = width - SCROLLBAR_WIDTH - (inner_padding * 2)
    local child = CreateFrame("Frame", nil, scroll)
    child:SetWidth(child_width)
    child:SetHeight(1)
    scroll:SetScrollChild(child)

    return container, scroll, child
end

-------------------------------------------------------------------------------
--- Utility
-------------------------------------------------------------------------------

local function get_group_display_name(group)
    if group.name and group.name ~= "" then
        return group.name
    end

    if group.item_ids and group.item_ids[1] then
        local name = C_Item.GetItemNameByID(group.item_ids[1])
        if name then
            return name
        end
    end

    return "Unnamed Group"
end

local function generate_group_key()
    local key = "group_" .. time() .. "_" .. math.random(1000, 9999)

    return key
end

local function delete_group(key)
    local group = CL.db.item_groups[key]
    if not group then return end

    local name = get_group_display_name(group)
    local popup = StaticPopup_Show("CONSUMABLESLIST_DELETE_GROUP", name)
    if popup then
        popup.data = key
    end
end

-------------------------------------------------------------------------------
--- Group List (Left Panel)
-------------------------------------------------------------------------------

local function clear_group_buttons(scroll_child)
    for _, btn in ipairs(group_buttons) do
        btn:Hide()
        btn:SetParent(nil)
    end

    wipe(group_buttons)
end

local function select_group(key)
    selected_group_key = key
    CL:RefreshOptionsEditor()
    CL:RefreshGroupList()
    CL:RefreshBagPanel()
end

local function create_group_button(parent, index, key, group)
    -- Row frame holding both the group button and trash icon
    local row = CreateFrame("Frame", nil, parent)
    local row_width = parent:GetWidth()
    row:SetSize(row_width, GROUP_BUTTON_HEIGHT)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (GROUP_BUTTON_HEIGHT + 3))

    -- Group select button (leaves room for trash icon on the right)
    local btn_width = row_width - TRASH_ICON_SIZE - 6
    local btn = create_styled_button(row, btn_width, GROUP_BUTTON_HEIGHT, get_group_display_name(group))
    btn:SetPoint("LEFT", row, "LEFT", 0, 0)

    if key == selected_group_key then
        btn._selected = true
        local r, g, b = CL:HexToRGB(group.color or "ffffff")
        btn.text:SetTextColor(r, g, b, 1)
        btn:SetBackdropColor(unpack(BG_SELECTED))
        btn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
    end

    btn:SetScript("OnClick", function()
        select_group(key)
    end)

    -- Trash icon button
    local trash = CreateFrame("Button", nil, row)
    trash:SetSize(TRASH_ICON_SIZE, TRASH_ICON_SIZE)
    trash:SetPoint("LEFT", btn, "RIGHT", 4, 0)

    local trash_icon = trash:CreateTexture(nil, "ARTWORK")
    trash_icon:SetAllPoints()
    trash_icon:SetAtlas("transmog-icon-remove")
    trash_icon:SetAlpha(0.5)

    trash:SetScript("OnEnter", function()
        trash_icon:SetAlpha(1.0)
        GameTooltip:SetOwner(trash, "ANCHOR_RIGHT")
        GameTooltip:SetText("Delete Group")
        GameTooltip:Show()
    end)

    trash:SetScript("OnLeave", function()
        trash_icon:SetAlpha(0.5)
        GameTooltip:Hide()
    end)

    trash:SetScript("OnClick", function()
        delete_group(key)
    end)

    return row
end

function CL:RefreshGroupList()
    if not CL.options_frame then return end

    local scroll_child = CL.options_frame.group_scroll_child
    clear_group_buttons(scroll_child)

    local index = 1
    for key, group in pairs(CL.db.item_groups) do
        local row = create_group_button(scroll_child, index, key, group)
        group_buttons[#group_buttons + 1] = row
        index = index + 1
    end

    scroll_child:SetHeight(math.max(1, (index - 1) * (GROUP_BUTTON_HEIGHT + 3)))
end

-------------------------------------------------------------------------------
--- Editor Panel (Right Panel - Top)
-------------------------------------------------------------------------------

local function clear_item_rows()
    for _, row in ipairs(item_rows) do
        row:Hide()
        row:SetParent(nil)
    end

    wipe(item_rows)
end

local function create_item_row(parent, index, item_id, group_key)
    local row = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    row:SetSize(parent:GetWidth(), ICON_SIZE)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -(index - 1) * (ICON_SIZE + 3))

    row:SetBackdrop(BACKDROP_NO_BORDER)
    row:SetBackdropColor(0.12, 0.12, 0.12, 0.5)

    -- Item icon
    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE - 4, ICON_SIZE - 4)
    icon:SetPoint("LEFT", row, "LEFT", 2, 0)

    local item_icon = C_Item.GetItemIconByID(item_id)
    if item_icon then
        icon:SetTexture(item_icon)
    end

    -- Item name text
    local name_text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    name_text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
    local item_name = C_Item.GetItemNameByID(item_id)
    name_text:SetText(item_name or ("Item " .. item_id))

    if not item_name then
        local item = Item:CreateFromItemID(item_id)
        item:ContinueOnItemLoad(function()
            local loaded_name = C_Item.GetItemNameByID(item_id)
            if loaded_name then
                name_text:SetText(loaded_name)
            end

            local loaded_icon = C_Item.GetItemIconByID(item_id)
            if loaded_icon then
                icon:SetTexture(loaded_icon)
            end
        end)
    end

    -- Item ID text
    local id_text = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    id_text:SetPoint("LEFT", name_text, "RIGHT", 8, 0)
    id_text:SetText("(" .. item_id .. ")")
    id_text:SetTextColor(0.5, 0.5, 0.5)

    -- Remove button
    local remove_btn = CreateFrame("Button", nil, row, "UIPanelCloseButton")
    remove_btn:SetSize(22, 22)
    remove_btn:SetPoint("RIGHT", row, "RIGHT", 0, 0)
    remove_btn:SetScript("OnClick", function()
        local group = CL.db.item_groups[group_key]
        if not group then return end

        for i, id in ipairs(group.item_ids) do
            if id == item_id then
                table.remove(group.item_ids, i)
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
        GameTooltip:SetItemByID(item_id)
        GameTooltip:Show()
    end)

    row:SetScript("OnLeave", function(self)
        self:SetBackdropColor(0.12, 0.12, 0.12, 0.5)
        GameTooltip:Hide()
    end)

    return row
end

function CL:RefreshOptionsEditor()
    if not CL.options_frame then return end

    local editor = CL.options_frame.editor
    clear_item_rows()

    if not selected_group_key or not CL.db.item_groups[selected_group_key] then
        editor:Hide()
        return
    end

    editor:Show()
    local group = CL.db.item_groups[selected_group_key]

    -- Update fields
    editor.name_box:SetText(group.name or "")
    editor.threshold_box:SetText(tostring(group.threshold or 0))
    editor.threshold_slider:SetValue(math.min(group.threshold or 0, 200))
    editor.color_box:SetText(group.color or "ffffff")

    -- Update color swatch
    local r, g, b = CL:HexToRGB(group.color or "ffffff")
    editor.color_swatch:SetColorTexture(r, g, b, 1)

    -- Populate item list
    local items_parent = editor.items_scroll_child
    for i, item_id in ipairs(group.item_ids) do
        local row = create_item_row(items_parent, i, item_id, selected_group_key)
        item_rows[#item_rows + 1] = row
    end

    items_parent:SetHeight(math.max(1, #group.item_ids * (ICON_SIZE + 3)))
end

-------------------------------------------------------------------------------
--- Bag Panel (Right Panel - Bottom)
-------------------------------------------------------------------------------

local function clear_bag_buttons()
    for _, btn in ipairs(bag_buttons) do
        btn:Hide()
        btn:SetParent(nil)
    end

    wipe(bag_buttons)
end

local function is_item_in_group(item_id, group_key)
    local group = CL.db.item_groups[group_key]
    if not group then return false end

    for _, id in ipairs(group.item_ids) do
        if id == item_id then
            return true
        end
    end

    return false
end

local function find_item_group(item_id)
    for key, group in pairs(CL.db.item_groups) do
        for _, id in ipairs(group.item_ids) do
            if id == item_id then
                return key
            end
        end
    end

    return nil
end

local function remove_item_from_group(item_id, group_key)
    local group = CL.db.item_groups[group_key]
    if not group then return end

    for i, id in ipairs(group.item_ids) do
        if id == item_id then
            table.remove(group.item_ids, i)
            break
        end
    end

    CL:RefreshOptionsEditor()
    CL:RefreshBagPanel()
    CL:RebuildDisplay()
end

local function add_item_to_selected_group(item_id)
    if not selected_group_key then
        CL:Print("Select an item group first.")
        return
    end

    local group = CL.db.item_groups[selected_group_key]
    if not group then return end

    if find_item_group(item_id) then
        CL:Print("Item already in a group.")
        return
    end

    group.item_ids[#group.item_ids + 1] = item_id
    CL:RefreshOptionsEditor()
    CL:RefreshBagPanel()
    CL:RebuildDisplay()
end

function CL:RefreshBagPanel()
    if not CL.options_frame then return end

    local bag_parent = CL.options_frame.bag_scroll_child
    clear_bag_buttons()

    local available_width = bag_parent:GetWidth()
    local col = 0
    local row = 0
    local max_cols = math.floor(available_width / (ICON_SIZE + ICON_PADDING))
    local seen_items = {}

    for bag = 0, 4 do
        local num_slots = C_Container.GetContainerNumSlots(bag)
        for slot = 1, num_slots do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info and info.itemID and not seen_items[info.itemID] then
                seen_items[info.itemID] = true

                -- Filter by item class
                local passes_filter = true
                local has_any_filter = next(active_bag_filters) ~= nil
                if has_any_filter then
                    local classID = select(12, GetItemInfo(info.itemID))
                    if classID == nil or not active_bag_filters[classID] then
                        passes_filter = false
                    end
                end

                if passes_filter then
                    local item_id = info.itemID
                    local owning_group = find_item_group(item_id)

                    local btn = CreateFrame("Button", nil, bag_parent)
                    btn:SetSize(ICON_SIZE, ICON_SIZE)
                    btn:SetPoint("TOPLEFT", bag_parent, "TOPLEFT",
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
                    local status_icon = btn:CreateTexture(nil, "OVERLAY", nil, 1)
                    local icon_size = ICON_SIZE * 0.8
                    status_icon:SetSize(icon_size, icon_size)
                    status_icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
                    status_icon:Hide()

                    if owning_group then
                        icon:SetDesaturated(true)
                        icon:SetAlpha(0.5)
                        overlay:SetColorTexture(0.8, 0, 0, 0.4)
                        status_icon:SetAtlas("transmog-icon-remove")
                    else
                        overlay:SetColorTexture(0, 0.6, 0, 0.35)
                        status_icon:SetTexture("Interface\\PaperDollInfoFrame\\Character-Plus")
                        status_icon:SetVertexColor(0, 1, 0)
                    end

                    btn:SetScript("OnClick", function()
                        if owning_group then
                            if owning_group == selected_group_key then
                                remove_item_from_group(item_id, owning_group)
                            else
                                local item_name = C_Item.GetItemNameByID(item_id) or ("Item " .. item_id)
                                local group = CL.db.item_groups[owning_group]
                                local group_name = group and group.name or owning_group
                                local dialog = StaticPopup_Show("CONSUMABLESLIST_REMOVE_ITEM", item_name, group_name)
                                if dialog then
                                    dialog.data = { item_id = item_id, group_key = owning_group }
                                end
                            end
                        else
                            add_item_to_selected_group(item_id)
                        end
                    end)

                    btn:SetScript("OnEnter", function(self)
                        overlay:Show()
                        status_icon:Show()
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:SetBagItem(bag, slot)
                        if owning_group then
                            local group = CL.db.item_groups[owning_group]
                            local group_name = group and group.name or owning_group
                            GameTooltip:AddLine(" ")
                            GameTooltip:AddLine("In group: " .. group_name, 1, 0.5, 0.5)
                            GameTooltip:AddLine("Click to remove", 0.8, 0.2, 0.2)
                        else
                            GameTooltip:AddLine(" ")
                            GameTooltip:AddLine("Click to add to selected group", 0.2, 0.8, 0.2)
                        end
                        GameTooltip:Show()
                    end)

                    btn:SetScript("OnLeave", function()
                        overlay:Hide()
                        status_icon:Hide()
                        GameTooltip:Hide()
                    end)

                    bag_buttons[#bag_buttons + 1] = btn

                    col = col + 1
                    if col >= max_cols then
                        col = 0
                        row = row + 1
                    end
                end
            end
        end
    end

    bag_parent:SetHeight(math.max(1, (row + 1) * (ICON_SIZE + ICON_PADDING)))
end

-------------------------------------------------------------------------------
--- Build Editor
-------------------------------------------------------------------------------

local function build_editor(parent, right_width, editor_height)
    local editor = CreateFrame("Frame", nil, parent)
    editor:SetPoint("TOPLEFT", parent, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, 0)
    editor:SetSize(right_width, editor_height)
    editor:Hide()

    local label_x = 0
    local field_x = 116

    -- Name field
    create_label(editor, "Display Name:", label_x, -5)
    editor.name_box = create_styled_editbox(editor, right_width - field_x - INSET_PADDING, field_x, 0)
    editor.name_box:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        group.name = self:GetText()
        CL:RefreshGroupList()
        CL:RebuildDisplay()
    end)

    -- Threshold field
    create_label(editor, "Threshold:", label_x, -35)
    editor.threshold_box = create_styled_editbox(editor, 60, field_x, -30)
    editor.threshold_box:SetNumeric(true)

    local slider = CreateFrame("Slider", nil, editor, "MinimalSliderTemplate")
    slider:SetSize(right_width - field_x - 60 - INSET_PADDING - 16, 20)
    slider:SetPoint("LEFT", editor.threshold_box, "RIGHT", 8, 0)
    slider:SetMinMaxValues(0, 200)
    slider:SetValueStep(1)
    slider:SetObeyStepOnDrag(true)

    editor.threshold_slider = slider

    slider:SetScript("OnValueChanged", function(self, value)
        local val = math.floor(value + 0.5)
        editor.threshold_box:SetText(tostring(val))
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        group.threshold = val
        CL:RebuildDisplay()
    end)

    editor.threshold_box:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        local val = self:GetNumber()
        group.threshold = val
        editor.threshold_slider:SetValue(math.min(val, 200))
        CL:RebuildDisplay()
    end)

    -- Color field
    create_label(editor, "Color:", label_x, -65)
    editor.color_box = create_styled_editbox(editor, 90, field_x, -60)
    editor.color_box:SetMaxLetters(6)
    editor.color_box:SetScript("OnTextChanged", function(self, userInput)
        if not userInput then return end

        local text = self:GetText()
        local cleaned = text:gsub("#", "")
        if cleaned ~= text then
            self:SetText(cleaned)
        end
    end)

    -- Clickable color swatch that opens the color picker
    local swatch_btn = CreateFrame("Button", nil, editor, "BackdropTemplate")
    swatch_btn:SetSize(22, 22)
    swatch_btn:SetPoint("LEFT", editor.color_box, "RIGHT", 8, 0)
    swatch_btn:SetBackdrop(CONTAINER_BACKDROP)
    swatch_btn:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)

    editor.color_swatch = swatch_btn:CreateTexture(nil, "ARTWORK")
    editor.color_swatch:SetPoint("TOPLEFT", swatch_btn, "TOPLEFT", 3, -3)
    editor.color_swatch:SetPoint("BOTTOMRIGHT", swatch_btn, "BOTTOMRIGHT", -3, 3)

    swatch_btn:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Click to pick a color")
        GameTooltip:Show()
    end)

    swatch_btn:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
        GameTooltip:Hide()
    end)

    local function apply_color(hex)
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        group.color = hex
        editor.color_box:SetText(hex)
        local r, g, b = CL:HexToRGB(hex)
        editor.color_swatch:SetColorTexture(r, g, b, 1)
        CL:RefreshGroupList()
        CL:RebuildDisplay()
    end

    swatch_btn:SetScript("OnClick", function()
        local group = CL.db.item_groups[selected_group_key]
        if not group then return end

        local r, g, b = CL:HexToRGB(group.color or "ffffff")
        local prev_hex = group.color or "ffffff"

        local info = {
            swatchFunc = function()
                local new_r, new_g, new_b = ColorPickerFrame:GetColorRGB()
                local hex = string.format("%02x%02x%02x",
                    math.floor(new_r * 255 + 0.5),
                    math.floor(new_g * 255 + 0.5),
                    math.floor(new_b * 255 + 0.5))
                apply_color(hex)
            end,
            cancelFunc = function()
                apply_color(prev_hex)
            end,
            r = r,
            g = g,
            b = b,
            hasOpacity = false,
        }

        ColorPickerFrame:SetupColorPickerAndShow(info)
    end)

    editor.color_box:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        local hex = self:GetText()
        if #hex == 6 then
            apply_color(hex)
        end
    end)

    -- Items label
    create_label(editor, "Items in Group:", label_x, -100)

    -- Items scroll container
    local items_top = 118
    local bottom_controls_height = 36
    local items_container_height = editor_height - items_top - bottom_controls_height

    local items_container, items_scroll, items_child = create_scroll_container(
        editor, right_width, items_container_height, 0, -items_top)
    editor.items_scroll_child = items_child

    -- Add by ID row
    local add_row_y = -(items_top + items_container_height + 8)
    create_label(editor, "Add Item by ID:", label_x, add_row_y - 5)
    editor.add_id_box = create_styled_editbox(editor, 100, field_x, add_row_y)
    editor.add_id_box:SetNumeric(true)
    editor.add_id_box:SetScript("OnEnterPressed", function(self)
        local item_id = self:GetNumber()
        if item_id <= 0 then return end

        add_item_to_selected_group(item_id)
        self:SetText("")
        self:ClearFocus()
    end)

    local add_btn = create_styled_button(editor, 50, 22, "Add")
    add_btn:SetPoint("LEFT", editor.add_id_box, "RIGHT", 6, 0)
    add_btn:SetScript("OnClick", function()
        local item_id = editor.add_id_box:GetNumber()
        if item_id <= 0 then return end

        add_item_to_selected_group(item_id)
        editor.add_id_box:SetText("")
        editor.add_id_box:ClearFocus()
    end)

    return editor
end

-------------------------------------------------------------------------------
--- Build Options Frame
-------------------------------------------------------------------------------

local function build_options_frame()
    if CL.options_frame then return end

    -- Main frame with dark backdrop (matching SlashBreakGambling style)
    local frame = CreateFrame("Frame", "ConsumablesListOptionsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(PANEL_WIDTH, PANEL_HEIGHT)
    frame:SetPoint("CENTER")
    frame:SetBackdrop(BACKDROP)
    frame:SetBackdropColor(0.08, 0.08, 0.08, 0.95)
    frame:SetBackdropBorderColor(unpack(BORDER_NORMAL))
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:SetFrameStrata("HIGH")
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
    title:SetTextColor(unpack(GOLD))

    -- Close button
    local close_btn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    close_btn:SetSize(24, 24)
    close_btn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)
    close_btn:SetScript("OnClick", function()
        frame:Hide()
    end)

    -- Title divider (more Y padding from title)
    local title_divider = frame:CreateTexture(nil, "ARTWORK")
    title_divider:SetHeight(2)
    title_divider:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -36)
    title_divider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -INSET_PADDING, -36)
    title_divider:SetColorTexture(0.3, 0.3, 0.3, 1)

    -- Content area (below divider)
    local content = CreateFrame("Frame", nil, frame)
    content:SetPoint("TOPLEFT", frame, "TOPLEFT", INSET_PADDING, -42)
    content:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -INSET_PADDING, INSET_PADDING)

    local content_height = PANEL_HEIGHT - 42 - INSET_PADDING
    local content_width = PANEL_WIDTH - (INSET_PADDING * 2)
    local right_width = content_width - GROUP_LIST_WIDTH - INSET_PADDING

    ---------------------------------------------------------------------------
    -- Left panel: Group list (full height)
    ---------------------------------------------------------------------------
    create_label(content, "Item Groups", 2, -2)

    local add_group_btn = create_styled_button(content,
        GROUP_LIST_WIDTH, GROUP_BUTTON_HEIGHT, "+ Add New Group")
    add_group_btn:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -20)
    add_group_btn:SetScript("OnClick", function()
        local key = generate_group_key()
        CL.db.item_groups[key] = {
            item_ids = {},
            threshold = 10,
            color = "ffffff",
            name = "New Group",
        }
        select_group(key)
        CL:RebuildDisplay()
    end)

    -- Group list scroll container (full height, bottom-aligned with content)
    local group_scroll_top = 50
    local group_container_height = content_height - group_scroll_top

    local group_container, group_scroll, group_child = create_scroll_container(
        content, GROUP_LIST_WIDTH, group_container_height, 0, -group_scroll_top)
    frame.group_scroll_child = group_child

    -- Vertical separator between left and right panels
    local v_sep = content:CreateTexture(nil, "ARTWORK")
    v_sep:SetWidth(2)
    v_sep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + 6, 0)
    v_sep:SetPoint("BOTTOMLEFT", content, "BOTTOMLEFT", GROUP_LIST_WIDTH + 6, 0)
    v_sep:SetColorTexture(0.3, 0.3, 0.3, 1)

    ---------------------------------------------------------------------------
    -- Right panel: Editor (top) + Bag items (bottom)
    ---------------------------------------------------------------------------
    local bag_label_height = 28
    local editor_height = content_height - BAG_PANEL_HEIGHT - bag_label_height - INSET_PADDING

    -- Editor
    frame.editor = build_editor(content, right_width, editor_height)

    -- Horizontal separator above bag panel
    local bag_section_top = editor_height + 8
    local h_sep = content:CreateTexture(nil, "ARTWORK")
    h_sep:SetHeight(2)
    h_sep:SetPoint("TOPLEFT", content, "TOPLEFT", GROUP_LIST_WIDTH + INSET_PADDING, -bag_section_top)
    h_sep:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, -bag_section_top)
    h_sep:SetColorTexture(0.3, 0.3, 0.3, 1)

    -- Bag items label and filter buttons
    local bag_label = create_label(content, "Inventory (Click to add / remove from Group):",
        GROUP_LIST_WIDTH + INSET_PADDING, -(bag_section_top + 10))

    local FILTER_BTN_SIZE = 24
    local FILTER_BTN_SPACING = 2
    local num_filters = #ITEM_CLASS_FILTERS
    local total_filters_width = num_filters * FILTER_BTN_SIZE + (num_filters - 1) * FILTER_BTN_SPACING
    for i, filter_info in ipairs(ITEM_CLASS_FILTERS) do
        local fbtn = CreateFrame("Button", nil, content, "BackdropTemplate")
        fbtn:SetSize(FILTER_BTN_SIZE, FILTER_BTN_SIZE)
        fbtn:SetPoint("TOPRIGHT", content, "TOPRIGHT",
            -(total_filters_width - (i * (FILTER_BTN_SIZE + FILTER_BTN_SPACING)) + FILTER_BTN_SPACING),
            -(bag_section_top + 6))

        fbtn:SetBackdrop(CONTAINER_BACKDROP)

        local ficon = fbtn:CreateTexture(nil, "ARTWORK")
        ficon:SetPoint("TOPLEFT", fbtn, "TOPLEFT", 2, -2)
        ficon:SetPoint("BOTTOMRIGHT", fbtn, "BOTTOMRIGHT", -2, 2)
        ficon:SetTexture(filter_info.icon)

        local function update_filter_btn_state()
            if active_bag_filters[filter_info.classID] then
                fbtn:SetBackdropBorderColor(unpack(BORDER_HIGHLIGHT))
                ficon:SetDesaturated(false)
                ficon:SetAlpha(1.0)
            else
                fbtn:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)
                ficon:SetDesaturated(true)
                ficon:SetAlpha(1.0)
            end
        end

        update_filter_btn_state()

        fbtn:SetScript("OnClick", function()
            if active_bag_filters[filter_info.classID] then
                active_bag_filters[filter_info.classID] = nil
            else
                active_bag_filters[filter_info.classID] = true
            end

            update_filter_btn_state()
            CL:RefreshBagPanel()
        end)

        fbtn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            local state = active_bag_filters[filter_info.classID] and "|cff00ff00ON|r" or "|cffff0000OFF|r"
            GameTooltip:SetText(filter_info.name .. " " .. state)
            GameTooltip:Show()
        end)

        fbtn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        bag_filter_buttons[#bag_filter_buttons + 1] = fbtn
    end

    -- Bag items scroll container (bottom-aligned with group list)
    local bag_container_top = bag_section_top + bag_label_height
    local bag_container_height = content_height - bag_container_top

    local bag_container, bag_scroll, bag_child = create_scroll_container(
        content, right_width, bag_container_height,
        GROUP_LIST_WIDTH + INSET_PADDING, -bag_container_top)
    frame.bag_scroll_child = bag_child

    CL.options_frame = frame

    -- Register with Settings panel
    local category = Settings.RegisterCanvasLayoutCategory(frame, "Consumables List")
    category.ID = ADDON_NAME
    Settings.RegisterAddOnCategory(category)
    CL.options_category = category
end

-------------------------------------------------------------------------------
--- Public API
-------------------------------------------------------------------------------

function CL:OpenOptions()
    build_options_frame()

    if CL.options_frame:IsShown() then
        CL.options_frame:Hide()
    else
        CL.options_frame:Show()
        CL:RefreshGroupList()
        CL:RefreshOptionsEditor()
        CL:RefreshBagPanel()
    end
end

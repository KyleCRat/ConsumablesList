local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Widget Library
-------------------------------------------------------------------------------

CL.UI = {}


-------------------------------------------------------------------------------
--- Style Constants
-------------------------------------------------------------------------------

CL.UI.GOLD = { 1, 0.82, 0, 1 }
CL.UI.BORDER_NORMAL = { 0.6, 0.6, 0.6, 1 }
CL.UI.BORDER_HIGHLIGHT = { 1, 0.82, 0, 1 }
CL.UI.BG_NORMAL = { 0.15, 0.15, 0.15, 1 }
CL.UI.BG_HOVER = { 0.25, 0.25, 0.25, 1 }
CL.UI.BG_PRESS = { 0.1, 0.1, 0.1, 1 }
CL.UI.BG_SELECTED = { 0.2, 0.18, 0.1, 1 }

CL.UI.BACKDROP = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 12,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
}

CL.UI.BACKDROP_NO_BORDER = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    tile = true,
    tileSize = 16,
    insets = { left = 0, right = 0, top = 0, bottom = 0 },
}

CL.UI.CONTAINER_BACKDROP = {
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 10,
    insets = { left = 2, right = 2, top = 2, bottom = 2 },
}


-------------------------------------------------------------------------------
--- Widget Constructors
-------------------------------------------------------------------------------

function CL.UI.CreateStyledButton(parent, width, height, text)
    local button = CreateFrame("Button", nil, parent, "BackdropTemplate")
    button:SetSize(width, height)
    button:SetBackdrop(CL.UI.BACKDROP)
    button:SetBackdropColor(unpack(CL.UI.BG_NORMAL))
    button:SetBackdropBorderColor(unpack(CL.UI.BORDER_NORMAL))

    button.text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.text:SetPoint("LEFT", button, "LEFT", 6, 0)
    button.text:SetPoint("RIGHT", button, "RIGHT", -6, 0)
    button.text:SetWordWrap(false)
    button.text:SetNonSpaceWrap(false)
    button.text:SetText(text)
    button.text:SetTextColor(unpack(CL.UI.GOLD))

    button:SetScript("OnEnter", function(self)
        self:SetBackdropColor(unpack(CL.UI.BG_HOVER))
        self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    end)

    button:SetScript("OnLeave", function(self)
        if self._selected then
            self:SetBackdropColor(unpack(CL.UI.BG_SELECTED))
            self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
        else
            self:SetBackdropColor(unpack(CL.UI.BG_NORMAL))
            self:SetBackdropBorderColor(unpack(CL.UI.BORDER_NORMAL))
        end
    end)

    button:SetScript("OnMouseDown", function(self)
        self:SetBackdropColor(unpack(CL.UI.BG_PRESS))
        self.text:ClearAllPoints()
        self.text:SetPoint("LEFT", self, "LEFT", 7, -1)
        self.text:SetPoint("RIGHT", self, "RIGHT", -5, -1)
    end)

    button:SetScript("OnMouseUp", function(self)
        self:SetBackdropColor(unpack(CL.UI.BG_HOVER))
        self.text:ClearAllPoints()
        self.text:SetPoint("LEFT", self, "LEFT", 6, 0)
        self.text:SetPoint("RIGHT", self, "RIGHT", -6, 0)
    end)

    return button
end

function CL.UI.CreateStyledEditBox(parent, width, x, y)
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
        self:SetBackdropBorderColor(unpack(CL.UI.BORDER_HIGHLIGHT))
    end)

    box:SetScript("OnEditFocusLost", function(self)
        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1)
    end)

    box:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
    end)

    return box
end

function CL.UI.CreateLabel(parent, text, x, y)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    label:SetText(text)
    label:SetTextColor(unpack(CL.UI.GOLD))

    return label
end

local SCROLLBAR_WIDTH = 20
local CONTAINER_PADDING = 4

function CL.UI.CreateScrollContainer(parent, width, height, x, y)
    -- Outer bordered frame
    local container = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    container:SetSize(width, height)
    container:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    container:SetBackdrop(CL.UI.CONTAINER_BACKDROP)
    container:SetBackdropColor(0.04, 0.04, 0.04, 0.9)
    container:SetBackdropBorderColor(0.4, 0.4, 0.4, 0.8)

    -- Scroll frame inside container, leaving room for scrollbar on right
    local innerPadding = CONTAINER_PADDING + 1
    local scroll = CreateFrame("ScrollFrame", nil, container, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", container, "TOPLEFT", innerPadding, -innerPadding)
    scroll:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(innerPadding + SCROLLBAR_WIDTH), innerPadding)

    -- Nudge the scrollbar left so it sits inside the container border
    local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
    if scrollbar then
        scrollbar:ClearAllPoints()
        scrollbar:SetPoint("TOPRIGHT", container, "TOPRIGHT", -(innerPadding), -(innerPadding + 16))
        scrollbar:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", -(innerPadding), (innerPadding + 16))
    end

    -- Consume mouse wheel on the container so it never falls through to game bindings
    container:EnableMouseWheel(true)
    container:SetScript("OnMouseWheel", function(_, delta)
        local scrollbar = scroll.ScrollBar or _G[scroll:GetName() .. "ScrollBar"]
        if scrollbar then
            local current = scrollbar:GetValue()
            local minVal, maxVal = scrollbar:GetMinMaxValues()
            local step = scrollbar:GetValueStep() or (maxVal - minVal) / 10
            local newVal = math.max(minVal, math.min(maxVal, current - (delta * step)))
            scrollbar:SetValue(newVal)
        end
    end)

    local childWidth = width - SCROLLBAR_WIDTH - (innerPadding * 2)
    local child = CreateFrame("Frame", nil, scroll)
    child:SetWidth(childWidth)
    child:SetHeight(1)
    scroll:SetScrollChild(child)

    return container, scroll, child
end

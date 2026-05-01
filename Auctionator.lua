local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Auctionator Integration
-------------------------------------------------------------------------------

local CALLER_ID = "ConsumablesList"
local LIST_NAME = "CL Shopping List"

local UNBOUND_TYPES = {
    [Enum.ItemBind.None] = true,
    [Enum.ItemBind.OnEquip] = true,
    [Enum.ItemBind.OnUse] = true,
}

local function isAuctionable(itemId)
    local bindType = select(14, GetItemInfo(itemId))

    return bindType and UNBOUND_TYPES[bindType]
end

local function isAuctionatorAvailable()
    return Auctionator and Auctionator.API and Auctionator.API.v1
        and Auctionator.API.v1.CreateShoppingList
        and Auctionator.API.v1.ConvertToSearchString
end

local function buildAndSubmitList()
    local searchStrings = {}

    for _, entry in ipairs(CL:GetSortedGroups()) do
        local group = entry.group
        if not group.itemIds or #group.itemIds == 0 then
            -- skip empty groups
        else

        local itemCount = 0
        for _, id in ipairs(group.itemIds) do
            itemCount = itemCount + GetItemCount(id, false)
        end

        if itemCount >= group.threshold then
            -- skip groups at or above threshold
        else

        local needed = group.threshold - itemCount
        for _, id in ipairs(group.itemIds) do
            local itemName = C_Item.GetItemNameByID(id)
            if not itemName or not isAuctionable(id) then
                -- skip uncached or non-auctionable items
            else

            local tier = C_TradeSkillUI.GetItemReagentQualityByItemInfo(id)
            local term = {
                searchString = itemName,
                isExact = true,
                quantity = needed,
            }

            if tier then
                term.tier = tier
            end

            searchStrings[#searchStrings + 1] =
                Auctionator.API.v1.ConvertToSearchString(CALLER_ID, term)

            end -- itemName
        end

        end -- below threshold
        end -- has items
    end

    if #searchStrings == 0 then
        CL:Print("All items are above threshold. Nothing to buy!")

        return
    end

    Auctionator.API.v1.CreateShoppingList(CALLER_ID, LIST_NAME, searchStrings)
    CL:Print(string.format(
        "Created Auctionator shopping list \"%s\" with %d items.",
        LIST_NAME, #searchStrings))
end

local function cacheAllItemData(callback)
    local continuable = ContinuableContainer:Create()
    local needsLoading = false

    for _, entry in ipairs(CL:GetSortedGroups()) do
        local group = entry.group
        if group.itemIds then
            for _, id in ipairs(group.itemIds) do
                if not C_Item.GetItemNameByID(id) then
                    needsLoading = true
                    continuable:AddContinuable(Item:CreateFromItemID(id))
                end
            end
        end
    end

    if not needsLoading then
        callback()

        return
    end

    CL:Print("Loading item data...")
    continuable:ContinueOnLoad(callback)
end

local function createShoppingList()
    if not isAuctionatorAvailable() then
        CL:Print("Auctionator is not installed or enabled.")

        return
    end

    cacheAllItemData(buildAndSubmitList)
end


-------------------------------------------------------------------------------
--- Slash Command
-------------------------------------------------------------------------------

CL.cmds.buy = {
    triggers = { 'buy', 'b' },
    name = "Buy",
    description = "Create an Auctionator shopping list for missing items.",
    func = createShoppingList,
}


-------------------------------------------------------------------------------
--- Options Button
-------------------------------------------------------------------------------

local buyButton = nil

hooksecurefunc(CL, "OpenOptions", function()
    if buyButton then return end
    if not CL.optionsFrame then return end
    if not isAuctionatorAvailable() then return end

    buyButton = CL.UI.CreateStyledButton(
        CL.optionsFrame, 290, 26,
        "Add missing items to Auctionator Shopping List")
    buyButton:SetPoint("TOPLEFT", CL.optionsFrame, "BOTTOMLEFT", 0, -4)
    buyButton:SetScript("OnClick", createShoppingList)
end)

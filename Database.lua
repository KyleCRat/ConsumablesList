ADDON_NAME, CL = ...

-------------------------------------------------------------------------------
--- Database Config
CL.db = {}

-- local function rgbaToHex(rgba)
--     local r = math.floor((rgba[1] or 1) * 255 + 0.5)
--     local g = math.floor((rgba[2] or 1) * 255 + 0.5)
--     local b = math.floor((rgba[3] or 1) * 255 + 0.5)
--     local a = math.floor((rgba[4] or 1) * 255 + 0.5)

--     return string.format("|c%02X%02X%02X%02X", a, r, g, b)
-- end

CL.db.item_groups = {
    -- group_name = {
    --     item_ids = {
    --         123,
    --         456,
    --     },
    --     threshold = 123,
    --     color = '#hexhex'
    -- },
    weapon_enchantments = {
        item_ids = {
            224107, -- 11.0.0: Algari Mana Oil
        },
        threshold = 20,
        color = 'fd54c2'
    },
    damage_potion = {
        item_ids = {
            212265, -- 11.0.0: Tempered Potion R3
            212264, -- 11.0.0: Tempered Potion R2
        },
        threshold = 40,
        color = 'e1ee43',
    },
    healing_potion = {
        item_ids = {
            244839, -- 11.2.0: Invigorating healing Potion
        },
        name = "Healing Potions",
        threshold = 40,
        color = 'b51f00',
    },
    invisbility_potion = {
        item_ids = {
            -- 212250, -- 11.0.0: Draught of Silent Footfalls
            191395, -- 10.0.0: Potion of the Hushed Zephyr
        },
        name = "Invis Pots",
        threshold = 10,
        color = 'c6dbe1',
    },
    flask = {
        item_ids = {
            212283, -- 11.0.0: Flask of Alchemical Chaos
        },
        name = "Flasks",
        threshold = 20,
        color = '#feb24a',
    },
    feast = {
        item_ids = {
            222733, -- 11.0.0 Feast of the Midnight Masquerade
        },
        threshold = 20,
        color = 'ffb18d'
    },
    -- hearty_feast = {
    --     item_ids = {

    --     }
    -- },
    hearty_food = {
        item_ids = {
            222776, -- 11.0.0: Hearty Beledar's Bounty
        },
        threshold = 10,
        color = 'e27e5e'
    },
}

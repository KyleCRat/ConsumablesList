ADDON_NAME, CL = ...

-------------------------------------------------------------------------------
--- Database Config
CL.db = {}

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
        -- name = "Healing Potions",
        threshold = 40,
        color = 'b51f00',
    },
    invisbility_potion = {
        item_ids = {
            -- 212250, -- 11.0.0: Draught of Silent Footfalls
            191395, -- 10.0.0: Potion of the Hushed Zephyr
        },
        -- name = "Invis Pots",
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

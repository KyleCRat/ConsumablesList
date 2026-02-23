local ADDON_NAME, CL = ...

-------------------------------------------------------------------------------
--- Database Config
CL.db = {}

CL.db.defaults = {
    -- group_name = {
    --     itemIds = {
    --         123,
    --         456,
    --     },
    --     threshold = 123,
    --     color = '#hexhex'
    -- },
    weapon_enchantments = {
        itemIds = {
            224107, -- 11.0.0: Algari Mana Oil
        },
        threshold = 20,
        color = 'fd54c2'
    },
    damage_potion = {
        itemIds = {
            212265, -- 11.0.0: Tempered Potion R3
            212264, -- 11.0.0: Tempered Potion R2
        },
        name = "Tempered Potions",
        threshold = 40,
        color = 'e1ee43',
    },
    healing_potion = {
        itemIds = {
            244839, -- 11.2.0: Invigorating healing Potion
        },
        name = "Health Pots",
        threshold = 40,
        color = 'b51f00',
    },
    invisbility_potion = {
        itemIds = {
            -- 212250, -- 11.0.0: Draught of Silent Footfalls
            191395, -- 10.0.0: Potion of the Hushed Zephyr
        },
        name = "Invis Pots",
        threshold = 10,
        color = 'c6dbe1',
    },
    flask = {
        itemIds = {
            212283, -- 11.0.0: Flask of Alchemical Chaos
        },
        name = "Flasks",
        threshold = 20,
        color = '#feb24a',
    },
    feast = {
        itemIds = {
            222733, -- 11.0.0 Feast of the Midnight Masquerade
        },
        name = "Feasts",
        threshold = 20,
        color = 'ffb18d'
    },
    hearty_feast = {
        itemIds = {
            222781, -- 11.0.0: Hearty Feat of the Midnight Masquerade
        },
        name = "Hearty Feasts",
        threshold = 1,
        color = "ffccc6",
    },
    hearty_food = {
        itemIds = {
            222776, -- 11.0.0: Hearty Beledar's Bounty
        },
        name = "Hearty Personal Food",
        threshold = 10,
        color = 'e27e5e'
    },
    auto_hammer = {
        itemIds = {
            132514, -- 7.0.0: Auto Hammer
        },
        name = "Auto Hammers",
        threshold = 5,
        color = 'f8b762',
    },
    jumper_cables = {
        itemIds = {
            221955, -- 11.0.0: Convincingly Realistic Jumper Cables
            221954,
        },
        name = "Jumper Cables",
        threshold = 5,
        color = 'ccf4ad',
    },
    pausing_pylons = {
        itemIds = {
            221949, -- 11.0.0: Pausing Pylons
        },
        name = "Pausing Pylons",
        threshold = 5,
        color = '65ebe7',
    },
}

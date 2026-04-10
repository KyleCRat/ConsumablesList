local ADDON_NAME, CL = ...

-------------------------------------------------------------------------------
--- Database Config
CL.db = {}

CL.db.defaults = {
    -- groupName = {
    --     itemIds = {
    --         123,
    --         456,
    --     },
    --     threshold = 123,
    --     color = '#hexhex'
    -- },
    weaponEnhancement = {
        itemIds = {
            243734, -- 12.0.0: Thalassian Phoenix Oil R2
            243733, -- 12.0.0: Thalassian Phoenix Oil R1
            243736, -- 12.0.0: Oil of Dawn R2
            243735, -- 12.0.0: Oil of Dawn R1
            243738, -- 12.0.0: Smuggler's Enchanted Edge R2
            243737, -- 12.0.0: Smuggler's Enchanted Edge R1
            237369, -- 12.0.0: Refulgent Weightstone R2
            237367, -- 12.0.0: Refulgent Weightstone R1
            237371, -- 12.0.0: Refulgent Whetstone R2
            237370, -- 12.0.0: Refulgent Whetstone R1
        },
        name = "Weapon Enhancements",
        threshold = 20,
        color = 'fd54c2',
    },
    combatPotion = {
        itemIds = {
            241308, -- 12.0.0: Light's Potential R2
            241309, -- 12.0.0: Light's Potential R1
            241288, -- 12.0.0: Potion of Recklessness R2
            241289, -- 12.0.0: Potion of Recklessness R1
            241292, -- 12.0.0: Draught of Rampant Abandon R2
            241293, -- 12.0.0: Draught of Rampant Abandon R1
            241296, -- 12.0.0: Potion of Zealotry R2
            241297, -- 12.0.0: Potion of Zealotry R1
            241286, -- 12.0.0: Light's Preservation R2
            241287, -- 12.0.0: Light's Preservation R1
        },
        name = "Combat Potions",
        threshold = 40,
        color = 'e1ee43',
    },
    manaPotion = {
        itemIds = {
            241300, -- 12.0.0: Lightfused Mana Potion R2
            241301, -- 12.0.0: Lightfused Mana Potion R1
        },
        name = "Mana Potions",
        threshold = 40,
        color = 'e1ee43',
    },
    healingPotion = {
        itemIds = {
            241304, -- 12.0.0 Silvermoon Health Potion R2
            241305, -- 12.0.0 Silvermoon Health Potion R1
        },
        name = "Health Potions",
        threshold = 40,
        color = 'b51f00',
    },
    invisbilityPotion = {
        itemIds = {
            212250, -- 11.0.0: Draught of Silent Footfalls
            191395, -- 10.0.0: Potion of the Hushed Zephyr
        },
        name = "Invisibility Potions",
        threshold = 20,
        color = 'c6dbe1',
    },
    masteryFlask = {
        itemIds = {
            241322, -- 12.0.0: Flask of the Magisters R2
            241323, -- 12.0.0: Flask of the Magisters R1
            241320, -- 12.0.0: Flask of the Thalassian Resistance R2
            241321, -- 12.0.0: Flask of the Thalassian Resistance R1
            241326, -- 12.0.0: Flask of the Shattered Sun R2
            241327, -- 12.0.0: Flask of the Shattered Sun R1
            241324, -- 12.0.0: Flask of the Blood Knights R2
            241325, -- 12.0.0: Flask of the Blood Knights R1
        },
        name = "Flasks",
        threshold = 20,
        color = '#feb24a',
    },
    heartyFeast = {
        itemIds = {
            242745, -- [Epic] Hearty Blooming Feast       | 98 Stam, 65 Primary Stat
            266996, -- [Epic] Hearty Harandar Celebration | 98 Stam, 65 Primary Stat
            242744, -- [Epic] Hearty Quel'dorei Medley    | 98 Stam, 65 Primary Stat
            266985, -- [Epic] Hearty Silvermoon Parade    | 98 Stam, 65 Primary Stat
            242273, -- [Rare] Blooming Feast    | 98 Stam, 65 Highest Secondary Stat
            242272, -- [Rare] Quel'dorei Medley | 98 Stam, 65 Highest Secondary Stat
        },
        name = "Feasts",
        threshold = 20,
        color = 'ffb18d'
    },
    -- boon = {
    --     itemIds = {
    --         267240, -- 12.0.0: Boon of Fortitude
    --         267235, -- 12.0.0: Boon of Vitality
    --         267236, -- 12.0.0: Boon of Speed
    --         267238, -- 12.0.0: Boon of Potency
    --         267239, -- 12.0.0: Boon of Possibilities
    --         267648, -- 12.0.0: Boon of Vigor
    --         267241, -- 12.0.0: Boon of Abstinence
    --         267237, -- 12.0.0: Boon of Power
    --     },
    --     name = "Boons",
    --     threshold = 5,
    --     color = 'ffb18d'
    -- },
    food = {
        itemIds = {
            242275, -- [Rare] Royal Roast                   | 50 Primary Stat
            242274, -- [Rare] Champion's Bento              | 65 Highest Secondary Stat
            255848, -- [Rare] Flora Frenzy                  | 65 Highest Secondary Stat
            242287, -- [Rare] Arcano Cutlets                | 59 Critical Strike
            242278, -- [Rare] Tasty Smoked Tetra            | 59 Critical Strike
            242283, -- [Rare] Sun-Seared Lumifin            | 59 Critical Strike
            242277, -- [Rare] Crimson Calamari              | 59 Haste
            242286, -- [Rare] Fel-Kissed Filet              | 59 Haste
            242282, -- [Rare] Null and Void Plate           | 59 Haste
            242285, -- [Rare] Warped Wise Wings             | 59 Mastery
            242281, -- [Rare] Glitter Skewers               | 59 Mastery
            242276, -- [Rare] Braised Blood Hunter          | 59 Versatility
            242280, -- [Rare] Buttered Root Crab            | 59 Versatility
            242284, -- [Rare] Void-Kissed Fish Rolls        | 59 Versatility
        },
        name = "Food",
        threshold = 10,
        color = 'e27e5e'
    },
    heartyFood = {
        itemIds = {
            242747, -- [Rare] Hearty Royal Roast            | 50 Primary Stat
            268679, -- [Rare] Hearty Impossibly Royal Roast | 50 Primary Stat
            242746, -- [Rare] Hearty Champion's Bento       | 65 Highest Secondary Stat
            268680, -- [Rare] Hearty Flora Frenzy           | 65 Highest Secondary Stat
            242750, -- [Rare] Hearty Tasty Smoked Tetra     | 59 Critical Strike
            242759, -- [Rare] Hearty Arcano Cutlets         | 59 Critical Strike
            242755, -- [Rare] Hearty Sun-Seared Lumifin     | 59 Critical Strike
            242749, -- [Rare] Hearty Crimson Calamari       | 59 Haste
            242758, -- [Rare] Hearty Fel-Kissed Filet       | 59 Haste
            242754, -- [Rare] Hearty Null and Void Plate    | 59 Haste
            242753, -- [Rare] Hearty Glitter Skewers        | 59 Mastery
            242757, -- [Rare] Hearty Warped Wise Wings      | 59 Mastery
            242752, -- [Rare] Hearty Buttered Root Crab     | 59 Versatility
            242756, -- [Rare] Hearty Void-Kissed Fish Rolls | 59 Versatility
            242748, -- [Rare] Hearty Braised Blood Hunter   | 59 Versatility
            242767, -- [Rare] Hearty Hearthflame Supper     | 22 Critical Strike, 22 Haste
            242762, -- [Rare] Hearty Wise Tails             | 22 Critical Strike, 22 Versatility
            242764, -- [Rare] Hearty Eversong Pudding       | 22 Mastery, 22 Critical Strike
            242768, -- [Rare] Hearty Bloodthistle-Wrapped C | 22 Mastery, 22 Haste
            242763, -- [Rare] Hearty Fried Bloomtail        | 22 Mastery, 22 Versatility
            242765, -- [Rare] Hearty Sunwell Delight        | 22 Versatility, 22 Haste
        },
        name = "Hearty Food",
        threshold = 10,
        color = 'e27e5e'
    },
    autoHammer = {
        itemIds = {
            132514, -- 7.0.0: Auto Hammer
        },
        name = "Auto Hammers",
        threshold = 5,
        color = 'f8b762',
    },
    jumperCables = {
        itemIds = {
            269586, -- 12.0.0: Emergency Soul Link R2
            248486, -- 12.0.0: Emergency Soul Link R1
        },
        name = "Jumper Cables",
        threshold = 5,
        color = 'ccf4ad',
    },
    pausingPylons = {
        itemIds = {
            221949, -- 11.0.0: Pausing Pylons
        },
        name = "Pausing Pylons",
        threshold = 5,
        color = '65ebe7',
    },
    augmentRune = {
        itemIds = {
            259085, -- 12.0.0: Void-Touched Augment Rune
        },
        name = "Augment Runes",
        threshold = 5,
        color = 'ba009f',
    },
}

CL.db.settingsDefaults = {
    enabled = true,

    fontName     = "PTSansNarrow-Bold",
    fontSize     = 30,
    lineHeight   = 29,
    useFullNames = false,

    showInNeighborhood  = true,
    showOnAHMount       = true,
    showOutsideOfCities = false,
}
